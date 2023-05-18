import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Screens/HomeScreen.dart';
import 'package:note_app/Widgets/adding_task_text.dart';
import 'package:note_app/Widgets/text_and_textField.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constants/colors.dart';
import '../Widgets/TextField.dart';
import '../cubits/hive_cubit/hive_cubit.dart';


class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HiveCubit,HiveStates>(
      listener: (context, state ){},
      builder: (context, state ){
        final cubit = BlocProvider.of<HiveCubit>(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon : Icon(Icons.arrow_back_ios,color: myPrimeColor,),
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
              },
              color: myPrimeColor, ),
            actions: [
              IconButton(
                onPressed: (){
                  cubit.changeMode();
                },
                icon: Icon(cubit.isMode? Icons.nightlight_round : Icons.sunny,
                    color:  myPrimeColor ),),
            ],
            elevation: 0,
            backgroundColor: cubit.isMode? Colors.white : Colors.black,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Add Task',
                    style: TextStyle(
                        color: cubit.isMode? Colors.black : Colors.white,
                        fontSize: 25),),
//title
            const  TheText(myText: 'Title'),
                  MyTextField(
                    myText: 'title',
                    controller: cubit.title,
                  ),
//The Task
                const  TheText(myText: 'The Task'),
                  MyTextField(controller: cubit.description, myText: 'your task'),
//date
                  const TheText(myText: 'Date'),
                  TextField(
                    keyboardType: TextInputType.none,
                    onTap: (){
                      showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2090)).then((value) {
                        cubit.date.text = DateFormat.yMMMMd().format(value!).toString();
                      });},
                    controller: cubit.date,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.calendar_month_outlined, color: myPrimeColor,),
                        hintText: 'Enter date Here',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        )

                    ),
                  ),

//time
                  Row(
                    children: [
                     TextAndTextField(time: cubit.startTime, myText: 'Start Time'),
                      const  SizedBox(width: 15,),
                    TextAndTextField(time: cubit.endTime, myText:'End Time'),
                    ],
                  ),

//Reminder
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0),
//                         child: Text('Reminder',style: TextStyle(
//                             color: cubit.isMode? Colors.black : Colors.white,
//                             fontSize: 20
//                         ),),
//                       ),
//                       //ReminderText
//                       TextField(
//                         keyboardType: TextInputType.none,
//                         decoration: InputDecoration(
//                             suffixIcon:
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height*0.06,
//                               child: DropdownButton<String>(
//                                 value: cubit.dropdownValue,
//                                 icon: Icon(Icons.keyboard_arrow_down_outlined,
//                                   color: myPrimeColor,),
//                                 iconSize: 30,
//                                 style:  TextStyle(color: myPrimeColor),
//                                 underline: const SizedBox(height: 0,),
//                                 onChanged: (String? value) {
//
//                                     cubit.dropdownValue = value!;
//
//                                 },
//                                 items:const [
//                                   DropdownMenuItem(value: '5',child: Text('5',style: TextStyle(fontSize: 23),)),
//                                   DropdownMenuItem(value: '10', child: Text('10',style: TextStyle(fontSize: 23),)),
//                                   DropdownMenuItem(value: '15', child: Text('15',style: TextStyle(fontSize: 23),)),
//                                   DropdownMenuItem(value: '20', child: Text('20',style: TextStyle(fontSize: 23),)),
//                                 ],),
//                             ),
//                             hintText: cubit.dropdownValue == null ? 'Minutes before the task' : '${cubit.dropdownValue} minutes  before the task',
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 1,
//                                 color: Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 1,
//                                 color: Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             )
//
//                         ),
//                       ),
// //Repeated
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 12.0),
//                         child: Text('Repeat',style: TextStyle(
//                             color: cubit.isMode? Colors.black : Colors.white,
//                             fontSize: 20
//                         ),),
//                       ),
//
//                       TextField(
//                         keyboardType: TextInputType.none,
//                         decoration: InputDecoration(
//                             suffixIcon:
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height*0.06,
//                               child: DropdownButton<String>(
//                                 value: cubit.repeatedValue,
//                                 icon: Icon(Icons.keyboard_arrow_down_outlined,
//                                   color: myPrimeColor,),
//                                 iconSize: 30,
//                                 underline: const SizedBox(height: 0,),
//                                 onChanged: (String? value) {
//                                   // This is called when the user selects an item.
//                                     cubit.repeatedValue = value!;
//
//                                 },
//                                 items: [
//                                   DropdownMenuItem(value: '0',child: Text('Daily',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
//                                   DropdownMenuItem(value: '1', child: Text('Monthly',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
//                                   DropdownMenuItem(value: '2', child: Text('Yearly',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
//                                   DropdownMenuItem(value: '3', child: Text('None',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
//                                 ],),
//                             ),
//                             hintText: cubit.repeatedValue == null ? 'Repeated Times' :  'Repeated ...',
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 1,
//                                 color: Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                 width: 1,
//                                 color: Colors.grey,
//                               ),
//                               borderRadius: BorderRadius.circular(15),
//                             )
//
//                         ),
//                       ),
//Color
                      Row(


                        // colors
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(

                            children: [

                              Text('Colors',style: TextStyle(
                                color:  cubit.isMode? Colors.black : Colors.white,
                                fontSize: 30,)
                                ,),

                              Row(

                                children: [
                                  GestureDetector(
                                    onDoubleTap: (){
                                      setState(() {

                                      });
                                      cubit.containerColor = myPrimeColor;
                                    },
                                    onTap: (){
                                      setState(() {
                                      });
                                      cubit.containerColor = const Color(0xffE5DCF1);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        backgroundColor: const Color(0xffE5DCF1),
                                        radius: 18,
                                        child: Icon(Icons.check,size: 33,
                                          color: cubit.containerColor == const Color(0xffE5DCF1) ? Colors.grey: const Color(0xffE5DCF1) ,),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onDoubleTap: (){
                                        setState(() {

                                        });
                                        cubit.containerColor = myPrimeColor;
                                      },
                                      onTap: (){
setState(() {

});
                                        cubit.containerColor = const Color(0xffCFCAFE);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: const Color(0xffCFCAFE),
                                        radius: 18,
                                        child: Icon(Icons.check,size: 33,
                                          color: cubit.containerColor == const Color(0xffCFCAFE)? Colors.grey: const Color(0xffCFCAFE) ,),

                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onDoubleTap: (){
                                        setState(() {

                                        });
                                        cubit.containerColor = myPrimeColor;
                                      },
                                      onTap: (){
setState(() {

});
                                        cubit.containerColor = const Color(0xffab98c7);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: const Color(0xffab98c7),
                                        radius: 18,
                                        child: Icon(Icons.check,size: 33,
                                          color: cubit.containerColor == const Color(0xffab98c7) ? Colors.white: const Color(0xffab98c7) ,),

                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],

                          ),
                          MaterialButton(onPressed: () async {
                            //   Alert(context: context, title: "FLUTTER", desc: "Flutter is awesome.").show();
                            if(cubit.title.text == ' ' || cubit.title.text.isEmpty ){
                              Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "WAIT",
                              desc: "You Need To Enter Your Task Title First",
                              buttons: [
                                DialogButton(
                                  color: myPrimeColor,
                                  onPressed: () => Navigator.pop(context),
                                  width: 125,
                                  child: const Text(
                                    "GOT IT",
                                    style: TextStyle(color: Colors.white, fontSize: 25),
                                  ),
                                )
                              ],
                            ).show();}
                            if(cubit.date.text.isEmpty){
                              Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "WAIT",
                              desc: "You Need To Enter Your Task Date First",
                              buttons: [
                                DialogButton(
                                  color: myPrimeColor,
                                  onPressed: () => Navigator.pop(context),
                                  width: 125,
                                  child: const Text(
                                    "GOT IT",
                                    style: TextStyle(color: Colors.white, fontSize: 25),
                                  ),
                                )
                              ],
                            ).show();}

                            else {
                             await Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));

                           await cubit.addTask(title: cubit.title.text,
                              taskState: 'TODO',
                              color: cubit.containerColor,
                              description: cubit.description.text,
                              endTime: cubit.endTime.text,
                              startTime: cubit.startTime.text,
                              date : cubit.date.text,
                            );
                           }
                          },
                            color: myPrimeColor,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            minWidth:MediaQuery.of(context).size.width*.35,
                            height: MediaQuery.of(context).size.height*0.06,
                            child: const Text('Create Task',
                              style: TextStyle(color: Colors.white,
                                  fontSize: 20),),)
                        ],
                      ),

                    ],
                  )

                ],
              ),
            ),
          ),

          backgroundColor: cubit.isMode? Colors.white : Colors.black,
        );
      },
    );
  }
}
