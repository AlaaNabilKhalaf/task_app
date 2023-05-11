import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Screens/Home_Screen.dart';
import '../constances/colors.dart';
import '../main.dart';

class AddTask extends StatefulWidget {
   const AddTask({Key? key}) : super(key: key);

static _AddTaskState of(BuildContext context) =>
    context.findAncestorStateOfType<_AddTaskState>()!;
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
 Color containerColor = Colors.grey.shade500 ;
   TextEditingController title = TextEditingController();

   TextEditingController description = TextEditingController();

   TextEditingController date = TextEditingController();

   TextEditingController startTime = TextEditingController();

   TextEditingController endTime = TextEditingController();

String ? dropdownValue;
String ? repeatedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon :const Icon(Icons.arrow_back_ios),
        onPressed: (){
          setState(() {
          });
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
        },
        color: myBlue, ),
        actions: [
          IconButton(
          onPressed: (){
            setState(() {
            });
            ThemingApp.of(context).changeMode();
          },
          icon: Icon(ThemingApp.of(context).isMode? Icons.nightlight_round : Icons.sunny,
            color:  ThemingApp.of(context).isMode? Colors.black : Colors.white, ),),
        ],
        elevation: 0,
        backgroundColor: ThemingApp.of(context).isMode? Colors.white : Colors.black,
      ),

      backgroundColor: ThemingApp.of(context).isMode? Colors.white : Colors.black,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Add Task',
                style: TextStyle(
                color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                fontSize: 25),),
//title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Title',style: TextStyle(
                  color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                  fontSize: 20
                ),),
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: 'Enter Title Here',
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
//note
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('The Task',style: TextStyle(
                  color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                  fontSize: 20
                ),),
              ),
              TextField(
                controller: description,
                decoration: InputDecoration(
                  hintText: 'Enter Note Here',
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
//date
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Date',style: TextStyle(
                  color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                  fontSize: 20
                ),),
              ),
              TextField(
                onTap: (){
                  setState(() {});
                  showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2090)).then((value) {
                        date.text = DateFormat.yMMMMd().format(value!).toString();
                      });},
                controller: date,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month_outlined, color: Colors.grey,),
                  hintText: 'Enter Date Here',
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Start Time',style: TextStyle(
                            color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                            fontSize: 20
                        ),),
                      ),
                      TextField(
                        onTap: (){
                          setState(() {});
                          showTimePicker(context: context,
                              initialTime: TimeOfDay.now()).then((value) {
                            startTime.text = value!.format(context);
                          });},
                        controller: startTime,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.watch_later_outlined,
                              color: Colors.grey,),
                            hintText: 'Enter Start Time Here',
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


                    ],
                  ),
                ),
              const  SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('End Time',style: TextStyle(
                            color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                            fontSize: 20
                        ),),
                      ),
                      TextField(
                        onTap: (){
                          setState(() {});
                          showTimePicker(context: context,
                              initialTime: TimeOfDay.now()).then((value) {
                            endTime.text = value!.format(context);});},
                        controller: endTime,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.watch_later_outlined, color: Colors.grey,),
                            hintText: 'Enter End Time Here',
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


                    ],
                  ),
                ),
              ],
            ),

//Reminder
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 12.0),
                 child: Text('Reminder',style: TextStyle(
                     color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                     fontSize: 20
                 ),),
               ),
 //ReminderText
               TextField(
                 decoration: InputDecoration(
                     suffixIcon:
                     SizedBox(
                       height: MediaQuery.of(context).size.height*0.06,
                       child: DropdownButton<String>(
                         value: dropdownValue,
                         icon: Icon(Icons.keyboard_arrow_down_outlined,
                           size: 33,
                           color: myBlue,),
                         style:  TextStyle(color: myBlue),
                         onChanged: (String? value) {
                           // This is called when the user selects an item.
                           setState(() {
                             dropdownValue = value!;
                           });
                         },
                         items:const [
                           DropdownMenuItem(value: '5',child: Text('5',style: TextStyle(fontSize: 23),)),
                           DropdownMenuItem(value: '10', child: Text('10',style: TextStyle(fontSize: 23),)),
                           DropdownMenuItem(value: '15', child: Text('15',style: TextStyle(fontSize: 23),)),
                           DropdownMenuItem(value: '20', child: Text('20',style: TextStyle(fontSize: 23),)),
                         ],),
                     ),
                     hintText: 'Time before the task',
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
//Repeated
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 12.0),
                 child: Text('Repeat',style: TextStyle(
                     color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                     fontSize: 20
                 ),),
               ),

               TextField(
                 decoration: InputDecoration(
                     suffixIcon:
                     SizedBox(
                       height: MediaQuery.of(context).size.height*0.06,
                       child: DropdownButton<String>(
                         value: repeatedValue,
                         icon: Icon(Icons.keyboard_arrow_down_outlined,
                           size: 33,
                           color: myBlue,),
                         style:  TextStyle(color: myBlue),
                         onChanged: (String? value) {
                           // This is called when the user selects an item.
                           setState(() {
                             repeatedValue = value!;
                           });
                         },
                         items:const [
                           DropdownMenuItem(value: '0',child: Text('0',style: TextStyle(fontSize: 23),)),
                           DropdownMenuItem(value: '1', child: Text('1',style: TextStyle(fontSize: 23),)),
                           DropdownMenuItem(value: '2', child: Text('2',style: TextStyle(fontSize: 23),)),
                           DropdownMenuItem(value: '3', child: Text('3',style: TextStyle(fontSize: 23),)),
                         ],),
                     ),
                     hintText: 'Repeated Times',
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
//Color
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                      Column(

                          children: [

            Text('Colors',style: TextStyle(

                  color:  ThemingApp.of(context).isMode? Colors.black : Colors.white,

                  fontSize: 30,)

                ,),

            Row(

                children: [
                  GestureDetector(
                    onTap: (){
                      containerColor = Colors.purple;

                    },
                    child: Container(

                    margin:const  EdgeInsets.all(3),

                      width: MediaQuery.of(context).size.width*0.08,

                      height: MediaQuery.of(context).size.height*0.08,

                      decoration: const BoxDecoration(

                        shape: BoxShape.circle,

                        color: Colors.purple

                      ),

                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      containerColor = Colors.pink;
                    },
                    child: Container(

                      margin:const  EdgeInsets.all(3),

                      width: MediaQuery.of(context).size.width*0.08,

                      height: MediaQuery.of(context).size.height*0.08,

                      decoration: const BoxDecoration(

                        shape: BoxShape.circle,

                        color: Colors.pink

                      ),

                    ),
                  ),

                  GestureDetector(
                      onTap: (){
                        containerColor = Colors.brown;
                      },
                    child: Container(

                      margin:const  EdgeInsets.all(3),

                      width: MediaQuery.of(context).size.width*0.08,

                      height: MediaQuery.of(context).size.height*0.08,

                      decoration: const BoxDecoration(

                        shape: BoxShape.circle,

                        color: Colors.brown

                      ),

                    ),
                  ),

                ],

            )

          ],

        ),
                     MaterialButton(onPressed: (){

                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                        ThemingApp.of(context).addTask(title: title.text,
                            color: containerColor,
                            description: description.text,
                            endTime: endTime.text,
                            startTime: startTime.text,
                            date : date.text,
                        );
                        print(ThemingApp.of(context).tasksData.toString());
                      });
                     },
                       color: myBlue,
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
    );
  }
}
