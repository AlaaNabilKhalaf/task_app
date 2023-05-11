import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Screens/Home_Screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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

 Color containerColor = myPrimeColor;

   TextEditingController title = TextEditingController();

   TextEditingController description = TextEditingController();

   TextEditingController date = TextEditingController();

   TextEditingController startTime = TextEditingController();

   TextEditingController endTime = TextEditingController();

String ? dropdownValue ;
String ? repeatedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon : Icon(Icons.arrow_back_ios,color: myPrimeColor,),
        onPressed: (){
          setState(() {
          });
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
        },
        color: myPrimeColor, ),
        actions: [
          IconButton(
          onPressed: (){
            setState(() {
            });
            ThemingApp.of(context).changeMode();
          },
          icon: Icon(ThemingApp.of(context).isMode? Icons.nightlight_round : Icons.sunny,
            color:  myPrimeColor ),),
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
                keyboardType: TextInputType.none,
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
                  suffixIcon: Icon(Icons.calendar_month_outlined, color: myPrimeColor,),
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
                        keyboardType: TextInputType.none,
                        onTap: (){
                          setState(() {});
                          showTimePicker(context: context,
                              initialTime: TimeOfDay.now()).then((value) {
                            startTime.text = value!.format(context);
                          });},
                        controller: startTime,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.watch_later_outlined,
                              color: myPrimeColor,),
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
                        keyboardType: TextInputType.none,
                        onTap: (){
                          setState(() {});
                          showTimePicker(context: context,
                              initialTime: TimeOfDay.now()).then((value) {
                            endTime.text = value!.format(context);});},
                        controller: endTime,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.watch_later_outlined, color: myPrimeColor,),
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
                 keyboardType: TextInputType.none,
                 decoration: InputDecoration(
                     suffixIcon:
                     SizedBox(
                       height: MediaQuery.of(context).size.height*0.06,
                       child: DropdownButton<String>(
                         value: dropdownValue,
                         icon: Icon(Icons.keyboard_arrow_down_outlined,
                           color: myPrimeColor,),
                         iconSize: 30,
                         style:  TextStyle(color: myPrimeColor),
                         underline: const SizedBox(height: 0,),
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
                     hintText: dropdownValue == null ? 'Minutes before the task' : '$dropdownValue minutes  before the task',
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
                 keyboardType: TextInputType.none,
                 decoration: InputDecoration(
                     suffixIcon:
                     SizedBox(
                       height: MediaQuery.of(context).size.height*0.06,
                       child: DropdownButton<String>(
                         value: repeatedValue,
                         icon: Icon(Icons.keyboard_arrow_down_outlined,
                           color: myPrimeColor,),
                         iconSize: 30,
                         underline: const SizedBox(height: 0,),
                         onChanged: (String? value) {
                           // This is called when the user selects an item.
                           setState(() {
                             repeatedValue = value!;
                           });
                         },
                         items: [
                           DropdownMenuItem(value: '0',child: Text('Daily',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
                           DropdownMenuItem(value: '1', child: Text('Monthly',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
                           DropdownMenuItem(value: '2', child: Text('Yearly',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
                           DropdownMenuItem(value: '3', child: Text('None',style: TextStyle(fontSize: 23,color: myPrimeColor),)),
                         ],),
                     ),
                     hintText: repeatedValue == null ? 'Repeated Times' :  'Repeated ...',
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
                      setState(() {
                      });
                      containerColor = Colors.purple;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.purple,
                        radius: 18,
                        child: Icon(Icons.check,size: 33,
                          color: containerColor == Colors.purple ? Colors.grey : Colors.purple ,),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {

                        });
                        containerColor = Colors.blueGrey;
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 18,
                        child: Icon(Icons.check,size: 33,
                          color: containerColor == Colors.blueGrey ? Colors.grey : Colors.blueGrey ,),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: (){
                          setState(() {
                          });
                          containerColor = Colors.brown;
                        },
                      child: CircleAvatar(
                        backgroundColor: Colors.brown,
                        radius: 18,
                        child: Icon(Icons.check,size: 33,
                        color: containerColor == Colors.brown ? Colors.grey : Colors.brown ,),
                      ),
                    ),
                  ),
                ],
            )
          ],

        ),
                     MaterialButton(onPressed: (){
                    //   Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
                         if(title.text == ' ' || title.text.isEmpty ){Alert(
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
                         if(date.text.isEmpty){Alert(
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

                        else{ Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                         ThemingApp.of(context).addTask(title: title.text,
                           taskState: 'TODO',
                           color: containerColor,
                           description: description.text,
                           endTime: endTime.text,
                           startTime: startTime.text,
                           date : date.text,
                         );
                         print(ThemingApp.of(context).tasksData.toString());}

                      setState(() {
                      });
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
    );
  }
}
