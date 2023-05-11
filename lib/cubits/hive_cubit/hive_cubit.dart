import 'dart:io';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import '../../Constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HiveCubit extends Cubit<HiveStates>{
  HiveCubit() : super(InitialHiveState());

  //Variables

  Color containerColor = myPrimeColor;

  String ? dropdownValue ;

  String ? repeatedValue;

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController date = TextEditingController();

  TextEditingController startTime = TextEditingController();

  TextEditingController endTime = TextEditingController();

  bool isMode = true;

  String cornerText = 'TODO';

  File? image ;

  final tasksRef = Hive.box('Tasks');

  List<Map<String,dynamic>> tasksData= [];

  String myDate = DateTime.now().toString();
  @override


  //Methods

  Future pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null)return;
    final imageTemporary = File(image.path);
      this.image = imageTemporary;
      emit(ImageChosen());
  }


//   changeContainerColor ({required Color chosenColor }){
//   containerColor == chosenColor ? Colors.grey : chosenColor ;
//   emit(ContainerColorChanged());
// }


  void changeMode(){
    isMode = !isMode;
    emit(ModeChanged());
  }


  void deleteTask({required taskKey}){
    tasksRef.delete(taskKey);
    emit(TaskDeleted());
  }


  void addTask
      ({required title,
    description ,
    startTime ,
    endTime ,
    required date,
    required Color color,
    required String taskState}) async {
    await tasksRef.add({
      'title' : title,
      'description' : description,
      'startTime' : startTime,
      'endTime' : endTime,
      'date' : date,
      'color' : color.value,
      'taskState' : taskState
    });
   await getTask(date: myDate);
    emit(TaskAdded());
  }

  List<Map<String,dynamic>> getTask({required String date}) {
    List<Map<String,dynamic>> list=[];
    final keys = tasksRef.keys;
    for (final key in keys) {
      final task = tasksRef.get(key);
      if (task['date'] == date) {
        final mapTask = {
          'key': key,
          'title': task['title'],
          'startTime': task['startTime'],
          'endTime': task['endTime'],
          'description': task['description'],
          'color' : task['color'],
          'taskState' : task['taskState'],
          'date' : task['date']
        };
        list.add(mapTask);
      }
    }
    tasksData = list;
    emit(TasksReturned());
    return list;
  }

  clearValues(){
    containerColor = myPrimeColor;
    title.clear();
    startTime.clear();
    endTime.clear();
    date.clear();
    emit(DataCleared());
  }














}