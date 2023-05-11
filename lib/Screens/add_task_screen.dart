import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Screens/HomeScreen.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import 'package:note_app/widgets/CreateTaskTap.dart';
import '../Constants/colors.dart';
import '../cubits/hive_cubit/hive_cubit.dart';

class AddTask extends StatefulWidget {
   const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<HiveCubit,HiveStates>(
      listener: (context, state ){},
      builder: (context, state ){
        final cubit = BlocProvider.of<HiveCubit>(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon : Icon(Icons.arrow_back_ios,color: myPrimeColor,),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                cubit.getTask(date: cubit.myDate);
                cubit.changeAnimationValue();
                Future.delayed(const Duration(milliseconds: 500),(){
                  cubit.makeAnimationValueTure();
                  // Future.delayed(const Duration(milliseconds: 400),(){
                  //
                  // });
                });
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('Title',style: TextStyle(
                        color: cubit.isMode? Colors.black : Colors.white,
                        fontSize: 20
                    ),),
                  ),
                  TextField(
                    controller: cubit.title,
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
                        color: cubit.isMode? Colors.black : Colors.white,
                        fontSize: 20
                    ),),
                  ),
                  TextField(
                    controller: cubit.description,
                    decoration: InputDecoration(
                        hintText: 'Enter Task Here',
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
                        color: cubit.isMode? Colors.black : Colors.white,
                        fontSize: 20
                    ),),
                  ),
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
                                  color: cubit.isMode? Colors.black : Colors.white,
                                  fontSize: 20
                              ),),
                            ),
                            TextField(
                              keyboardType: TextInputType.none,
                              onTap: (){
                                setState(() {});
                                showTimePicker(context: context,
                                    initialTime: TimeOfDay.now()).then((value) {
                                  cubit.startTime.text = value!.format(context);
                                });},
                              controller: cubit.startTime,
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
                                  color: cubit.isMode? Colors.black : Colors.white,
                                  fontSize: 20
                              ),),
                            ),
                            TextField(
                              keyboardType: TextInputType.none,
                              onTap: (){
                                showTimePicker(context: context,
                                    initialTime: TimeOfDay.now()).then((value) {
                                  cubit.endTime.text = value!.format(context);});},
                              controller: cubit.endTime,
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

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.22,
                    width: MediaQuery.of(context).size.width*0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index){
                            return GestureDetector(
                              onDoubleTap: (){
                               setState(() {
                                 cubit.selectedIndex = 5 ;
                               });
                              },
                              onTap: (){
                             setState(() {
                               cubit.changeContainerColorMethod(index: index);
                               cubit.insertImageTask(taskImage: cubit.images[index]);
                               cubit.insertContainerText(myContainerText: cubit.texts[index]);

                             });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  alignment: Alignment.bottomCenter,
                                  height: MediaQuery.of(context).size.height*0.2,
                                  width: MediaQuery.of(context).size.width*0.45,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(cubit.images[index],),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(26),
                                      border: Border.all(
                                        width: 5,
                                        color: cubit.selectedIndex == index ? myPrimeColor : Colors.transparent,
                                      )
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: myPrimeColor
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(cubit.texts[index],
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black
                                        ),),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder:(context , index)=> const SizedBox(width: 8,) ,
                          itemCount:cubit.images.length ),
                    ),
                  ),

                   Row(
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
                                      cubit.containerColor = myPrimeColor;
                                      setState(() {
                                      });
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
                                          color: cubit.containerColor == const Color(0xffE5DCF1) ? Colors.white: const Color(0xffE5DCF1) ,),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onDoubleTap: (){
                                        cubit.containerColor = myPrimeColor;
                                        setState(() {
                                        });
                                      },
                                      onTap: (){
                                        setState(() {});
                                        cubit.containerColor = const Color(0xffCFCAFE);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: const Color(0xffCFCAFE),
                                        radius: 18,
                                        child: Icon(Icons.check,size: 33,
                                          color: cubit.containerColor == const Color(0xffCFCAFE)? Colors.white: const Color(0xffCFCAFE) ,),

                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onDoubleTap: (){
                                        cubit.containerColor = myPrimeColor;
                                        setState(() {
                                        });
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

             const MyTap(),
                        ],
                      ),
                    ],
                  )
              ),
            ),

          backgroundColor: cubit.isMode? Colors.white : Colors.black,
        );
      },
    );
  }
}

//Reminder
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
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
//                                   setState(() {
//                                     cubit.repeatedValue = value!;
//                                   });
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