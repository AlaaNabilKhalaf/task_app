import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Screens/Task_Screen.dart';
import 'package:note_app/Screens/add_task_screen.dart';
import 'package:note_app/cubits/hive_cubit/hive_cubit.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import '../Constants/colors.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool startAnimated = false ;

  @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });
  //   setState(() {
  //     startAnimated = true ;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

  // Widget Calender (){
  //   final FixedExtentScrollController itemController =
  //   FixedExtentScrollController();
  //   return Container(
  //   //  alignment: Alignment.topRight,
  //       height: MediaQuery.of(context).size.height*0.7,
  //       width: double.infinity,
  //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //       child: HorizontalCalendar(DateTime.now(),
  //           width: MediaQuery.of(context).size.width*.25,
  //         height: MediaQuery.of(context).size.height*0.15,
  //           selectionColor: myBlue,
  //           itemController: itemController,
  //      ));
  //   }
    final cubit = BlocProvider.of<HiveCubit>(context);
    return BlocConsumer<HiveCubit,HiveStates>(
      listener: (context,state){},
      builder: (context , state) {
        return
        Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: cubit.isMode? Colors.white : Colors.black,
          leading:
          IconButton(
            onPressed: (){
              setState(() {
              });
              cubit.changeMode();
            },
            icon: Icon(cubit.isMode? Icons.nightlight_round : Icons.sunny,
                color: myPrimeColor),),
          actions: [
            GestureDetector(
              onTap: () {
                try{cubit.pickImage();}catch(e){
                  print('the error is $e');
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: myPrimeColor,
                      shape: BoxShape.circle
                  ),
                  child: cubit.image == null ? const Icon(Icons.person,size: 30,)  :
                  Image.file(cubit.image!,height: 40,width: 40,fit: BoxFit.cover,),
                ),
              ),
            )
          ],
        ),

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(DateFormat.yMMMMd().format(DateTime.now()),
                            style:  TextStyle(
                                fontSize: 30,
                                color: cubit.isMode? Colors.black : Colors.white,
                            ),),
                        ),
                        Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('Today',style: TextStyle(
                              color: cubit.isMode? Colors.black : Colors.white,
                              fontSize: 30
                          ),),
                        )
                      ]
                  ),
                  MaterialButton(onPressed: ()
                  {
                    cubit.clearValues();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddTask()));
                  },
                    color: myPrimeColor,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    minWidth:MediaQuery.of(context).size.width*.35,
                    height: MediaQuery.of(context).size.height*0.06,
                    child: const Text('+ Add Task',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20),),
                  )
                ],
              ),

            ),
            Expanded(
              flex: 2,
              child: Container(
                height: MediaQuery.of(context).size.height*0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color : cubit.isMode? Colors.white : Colors.black,
                ),
                child: DatePicker(
                  DateTime.now(),
                  width: MediaQuery.of(context).size.width*0.23,
                  height: MediaQuery.of(context).size.height*0.6,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: myPrimeColor,
                  selectedTextColor: cubit.isMode?  Colors.black : Colors.white ,
                  dateTextStyle: const TextStyle(
                      fontSize: 24,
                      color: Colors.grey
                  ),
                  monthTextStyle:const TextStyle(
                      color: Colors.grey,
                      fontSize: 24
                  ),
                  dayTextStyle: const TextStyle(
                      fontSize: 22,
                      color: Colors.grey
                  ),
                  onDateChange: (data){
                  Future.delayed(Duration(milliseconds: 500),(){
                  setState(() {
                  startAnimated = true;
                  });
                  });
                    cubit.myDate = DateFormat.yMMMMd().format(data);
                    cubit.getTask(date: cubit.myDate.toString());
                  },),),),
            cubit.tasksData.isEmpty?
            Expanded(
              flex: 9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/images/—Pngtree—blue mobile phone layout free_4404519.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.35,),
                  const Text("You don't have any tasks yet",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19
                    ),),
                  const  Text("Add new tasks to make your day productive",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19
                    ),),
                ],
              ),
            ) :
            // ListView
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                    itemBuilder: (context , index){
                      return
                        AnimatedContainer(
                          decoration: BoxDecoration(
                            color: Color(cubit.tasksData[index]['color']??5555),
                            borderRadius: BorderRadius.circular(15.0),),
                          height:MediaQuery.of(context).size.width*0.30,
                          curve: Curves.easeInOut,
                          transform: Matrix4.translationValues(startAnimated ? 0 : double.infinity, 0, 0),
                          duration: Duration(milliseconds: 300 + (index * 100)),
                          child: Row(
                        children: [
                        Expanded(
                        flex: 7,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                              });
                              cubit.clearValues();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  TaskScreen(task: cubit.tasksData[index],)));
                            },
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cubit.tasksData[index]['title'],
                                      style: const TextStyle(
                                          fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black
                                      ),),

                                    if(cubit.tasksData[index]['startTime'] == null || cubit.tasksData[index]['endTime'] == null  )
                                      const SizedBox(height: 10,),
                                    if(cubit.tasksData[index]['startTime'] != '' || cubit.tasksData[index]['endTime'] != '' )
                                      Row(
                                        children: [const Icon(Icons.watch_later_outlined,
                                          color:  Colors.black ,
                                          size: 20,),
                                          Text(' ${cubit.tasksData[index]['startTime'].toString()}',
                                            style: const TextStyle(
                                                color: Colors.black
                                            ),),
                                          const Text(' - ',style: TextStyle(
                                              color: Colors.black
                                          ),),
                                          Text(cubit.tasksData[index]['endTime'].toString(),style:const TextStyle(
                                              color: Colors.black
                                          ),),
                                        ],
                                      ),


                                    Text(cubit.tasksData[index]['description'],style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 85,width: 15,
                      child: VerticalDivider(width: 1,color: Colors.white,),),
                      GestureDetector(
                      onTap: (){
                      showModalBottomSheet(
                      elevation: 30,
                      context: (context), builder: (context){
                      return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                      child: Column(
                      children: [
                      MaterialButton(onPressed: (){
                      cubit.tasksData[index]['taskState'] = 'Completed';
                      setState(() {
                      Navigator.pop(context);
                      });
                      },
                      color: myPrimeColor,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                      minWidth:double.infinity,
                      height: MediaQuery.of(context).size.height*0.06,
                      child: const Text('Complete Task',
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),),
                      ),
                      const  SizedBox(height: 10,),
                      MaterialButton(onPressed: (){
                      cubit.deleteTask(taskKey:
                      cubit.tasksData[index]['key']);
                      cubit.getTask(date: cubit.myDate);
                      Navigator.pop(context);

                      },
                      color: Colors.redAccent,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                      minWidth:double.infinity,
                      height: MediaQuery.of(context).size.height*0.06,
                      child: const Text('Delete Task',
                      style: TextStyle(color: Colors.white,
                      fontSize: 20),),
                      ),
                      const  SizedBox(height: 35,),

                      Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.06,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                      width: 1
                      )
                      ),
                      child: Text('Close',
                      style: TextStyle(color: myPrimeColor,
                      fontSize: 30),),
                      )

                      ],
                      ),
                      ),
                      );
                      });
                      },
                      child: SizedBox(
                      width: 35,
                      child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(cubit.tasksData[index]['taskState'].toString(),
                      style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black
                      ),),
                      ),
                      ),
                      )
                      ],
                      ),
                        );
                    },
                    separatorBuilder: (context ,index){
                      return  const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount:cubit.tasksData.length),
              ),
            )

          ],
        ),

          backgroundColor: cubit.isMode? Colors.white : Colors.black,
      ); },

    );
  }
}
