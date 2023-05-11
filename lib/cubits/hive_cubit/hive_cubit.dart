
import 'dart:io';
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

  bool startAnimated = false ;
bool changeContainerColor = false ;
  dynamic task ;
List<String> images = [
  'lib/assets/images/family.png',
  'lib/assets/images/Lovepik_com-401148060-relaxing-summer-vacation.png',
  'lib/assets/images/studying.png',
  'lib/assets/images/—Pngtree—modern flat design concept of_5332905.png',
] ;
  Color containerColor = myPrimeColor;

  String ? dropdownValue ;

  String ? repeatedValue;

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController date = TextEditingController();

  TextEditingController startTime = TextEditingController();

  TextEditingController endTime = TextEditingController();

  bool isMode = true;


 late Color imageOne ;
 late Color imageTwo ;
 late Color imageThree ;
  late Color imageFour ;

  String cornerText = 'TODO';

  File? image ;

  File?myImage;

  final tasksRef = Hive.box('Tasks');

  List<Map<String,dynamic>> tasksData= [];

  String im = '';

  String myDate = DateTime.now().toString();
  //Methods

//
  changeContainerColorMethod ({required index}){
if(index == 0)
   { Color imageOne = myPrimeColor;
   Color imageTwo = isMode ? Colors.white: Colors.black;
   Color imageThree = isMode ? Colors.white: Colors.black;
   Color imageFour = isMode ? Colors.white: Colors.black;}

if(index == 1)
{ Color imageOne = isMode ? Colors.white: Colors.black;
Color imageTwo = myPrimeColor;
Color imageThree = isMode ? Colors.white: Colors.black;
Color imageFour = isMode ? Colors.white: Colors.black;}
if(index == 2)
{ Color imageOne = isMode ? Colors.white: Colors.black;
Color imageTwo = isMode ? Colors.white: Colors.black;
Color imageThree = myPrimeColor;
Color imageFour = isMode ? Colors.white: Colors.black;

}
if(index == 3)
{ Color imageOne = isMode ? Colors.white: Colors.black;
Color imageTwo = isMode ? Colors.white: Colors.black;
Color imageThree = isMode ? Colors.white: Colors.black;
Color imageFour = myPrimeColor;
}
if(index == null ){
  Color imageOne = isMode ? Colors.white: Colors.black;
  Color imageTwo = isMode ? Colors.white: Colors.black;
  Color imageThree = isMode ? Colors.white: Colors.black;
  Color imageFour = isMode ? Colors.white: Colors.black;
}

  emit(ContainerColorChanged());
}


  void changeMode(){
    isMode = !isMode;
    emit(ModeChanged());
  }


  void deleteTask({required taskKey}){
    tasksRef.delete(taskKey);
    emit(TaskDeleted());
  }


 Future addTask ({required title, description , startTime ,
    endTime , required date, required Color color,
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
    emit(TaskAdded());
   getTask(date: myDate);

  }


  List<Map<String,dynamic>> getTask({required String date}) {
    emit(StartGettingData());
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
    description.clear();
    emit(DataCleared());
  }


  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null)return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
    emit(Loading());
    emit(ImageChosen());
   // await addImage(image: image);
   //  getImage();
    return image;

  }


 Future addImage({required image})async{
    await tasksRef.add({
      'imagePath' : image
    });
  emit(ImagePathAdded());
  }


   getImage() {
      List<Map<String,dynamic>> list=[];
      final keys = tasksRef.keys;
      for (final key in keys) {
        final images = tasksRef.get(key);
        final mapImage = {
          'imagePath' : images['imagePath'],
          'key' : key
        };
        list.add(mapImage);
        }
     im =  list.last.toString() ;
      myImage = File(im);
emit(ImagePathReturned());

    }


  changeAnimationValue(){
    startAnimated = ! startAnimated ;
    // emit(AnimationValueChanged());
  }


  makeAnimationValueTure(){
    startAnimated = true ;
    emit(MakeAnimationValueTure());
  }


  makeAnimationValueFalse (){
    startAnimated = false ;
    emit(MakeAnimationValueFalse());
  }


  initialTheTask({required int index}){
    task = tasksData[index];
    emit(InitialedTheTask());

}


}