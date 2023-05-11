
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import '../../Constants/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HiveCubit extends Cubit<HiveStates> {
  HiveCubit() : super(InitialHiveState());

  //Variables

  String? imageOfTheTask;

  bool startAnimated = false;

  bool theTextBool = true ;

  int selectedIndex = 5;

  //bool changeContainerColor = false ;

  dynamic task;

  int textIndex = 5 ;

  List<String> texts = [
    'Quality Time',
    'Relaxing',
    'Studying',
    'Working'];

  List<String> images = [
    'lib/assets/images/family.png',
    'lib/assets/images/Lovepik_com-401148060-relaxing-summer-vacation.png',
    'lib/assets/images/studying.png',
    'lib/assets/images/—Pngtree—modern flat design concept of_5332905.png',
  ];

  Color containerColor = myPrimeColor;

  // String ? dropdownValue;
  //
  // String ? repeatedValue;

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController date = TextEditingController();

  TextEditingController startTime = TextEditingController();

  TextEditingController endTime = TextEditingController();

  bool isMode = true;

  String containerText = ' jgdfjkdjajd' ;

  File? image;

  File?myImage;

  final tasksRef = Hive.box('Tasks');

  List<Map<String, dynamic>> tasksData = [];

  String im = '';

  String myDate = DateFormat.yMMMMd().format(DateTime.now()).toString();

  //Methods

 void getTextIndex({required index}){
    textIndex = index ;
    emit(TextIndexReturned());
  }

  changeContainerColorMethod({required int index}) {
    selectedIndex = index;
    emit(ContainerColorChanged());
  }

  void changeTheText ({ required int index}){
    tasksData[index]['taskState'] = 'Complete';
    emit(TheTextChanged());
  }
  void changeMode() {
    isMode = !isMode;
    emit(ModeChanged());
  }


  void deleteTask({required taskKey}) {
    tasksRef.delete(taskKey);
    emit(TaskDeleted());
  }

  Future addTask({ title, description, startTime,
    endTime, date, required Color color,
    required String taskState,
    taskImage, required String containerText
  }) async {
    await tasksRef.add({
      'title': title,
      'description': description,
      'startTime': startTime,
      'endTime': endTime,
      'date': date,
      'color': color.value,
      'taskState': taskState,
      'taskImage': taskImage,
      'containerText' : containerText,
    });
    emit(TaskAdded());
    getTask(date: myDate);
  }


  List<Map<String, dynamic>> getTask({required String date}) {
    emit(StartGettingData());
    List<Map<String, dynamic>> list = [];
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
          'color': task['color'],
          'taskState': task['taskState'],
          'date': task['date'],
          'taskImage': task[ 'taskImage'],
          'containerText' : task['containerText'],

        };
        list.add(mapTask);
      }
    }
    tasksData = list;
    emit(TasksReturned());
    return list;
  }


  clearValues() {
    containerColor = myPrimeColor;
    title.clear();
    startTime.clear();
    endTime.clear();
    date.clear();
    description.clear();
    selectedIndex = 5;
    emit(DataCleared());
  }


  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    emit(Loading());
    emit(ImageChosen());
    // await addImage(image: image);
    //  getImage();
    return image;
  }


  Future addImage({required image}) async {
    await tasksRef.add({
      'imagePath': image
    });
    emit(ImagePathAdded());
  }


  getImage() {
    List<Map<String, dynamic>> list = [];
    final keys = tasksRef.keys;
    for (final key in keys) {
      final images = tasksRef.get(key);
      final mapImage = {
        'imagePath': images['imagePath'],
        'key': key
      };
      list.add(mapImage);
    }
    im = list.last.toString();
    myImage = File(im);
    emit(ImagePathReturned());
  }


  changeAnimationValue() {
    startAnimated = !startAnimated;
    // emit(AnimationValueChanged());
  }


  makeAnimationValueTure() {
    startAnimated = true;
    emit(MakeAnimationValueTure());
  }


  makeAnimationValueFalse() {
    startAnimated = false;
    emit(MakeAnimationValueFalse());
  }


  initialTheTask({required int index}) {
    task = tasksData[index];
    emit(InitialedTheTask());
  }

  insertImageTask({required String taskImage}) {
    imageOfTheTask = taskImage;
    emit(TaskImageInserted());
  }
  insertContainerText({required String myContainerText}) {
    containerText = myContainerText;
    emit(ContainerTextInserted());
  }

  void snackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: text),
    );
  }





}