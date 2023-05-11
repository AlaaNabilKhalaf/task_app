import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/hive_cubit/hive_cubit.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import '../Constants/colors.dart';

class TaskScreen extends StatelessWidget {
 const TaskScreen({super.key, required task});

  get task => this.task;

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<HiveCubit,HiveStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          final cubit = BlocProvider.of<HiveCubit>(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor:cubit.isMode? Colors.white : Colors.black,
              elevation: 0,
            ),

            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text('Hello, There',style: TextStyle(
                    fontSize: 40,
                  ),),
                  const  Text('You Have a New Reminder',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Container(
                      width:double.infinity,
                      height: MediaQuery.of(context).size.height*0.65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: myPrimeColor,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  //title
                                  children: const [
                                    Icon(Icons.title,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Title',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(task['title'].toString(), style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28
                                ),),
                              ),
                              //description
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.file_copy,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Description',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Text(task['description'].toString(),  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                ),),
                              ),
                              //date
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.calendar_month_sharp,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Date',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Text(task['date'].toString(),  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                ),),
                              ),
                              //time
                             // if(cubit.tasksData[index]['startTime'] == null || cubit.tasksData[index]['endTime'] == null  )
                             //   const SizedBox(height: 10,),
                             // if(cubit.tasksData[index]['startTime'] != '' || cubit.tasksData[index]['endTime'] != '' )
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: const [
                                    Icon(Icons.watch_later_outlined,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Time',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),
                                  Padding(
                                padding:const EdgeInsets.all(8.0),
                                child:  Text( '${task['startTime']} - ${task['endTime']}'
                                ,  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                ),),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            backgroundColor: cubit.isMode? Colors.white : Colors.black,
          );
        },
      );
  }
}
