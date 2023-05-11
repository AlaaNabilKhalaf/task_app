import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/hive_cubit/hive_cubit.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import '../Constants/colors.dart';

class TaskScreen extends StatelessWidget {
 const TaskScreen({super.key});

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
                  const Text('Hello, Beauty',style: TextStyle(
                    fontSize: 40,
                  ),),
                  const  Text('Remember To Take It Easy ',style: TextStyle(
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
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  //title
                                  children:  [
                                    Icon(Icons.title,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Title',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(cubit.task['title'].toString(), style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28
                                ),),
                              ),
                              //description
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children:  [
                                    Icon(Icons.file_copy,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Description',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Text(cubit.task['description'].toString(),  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                ),),
                              ),
                              //date
                              const Padding(
                                padding:  EdgeInsets.all(10.0),
                                child: Row(
                                  children:[
                                    Icon(Icons.calendar_month_sharp,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Date',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),
                             Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  Text(cubit.task['date'].toString(),  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30
                                ),),
                              ),
                              //time
                             if(cubit.task['startTime'] == null || cubit.task['endTime'] == null  )
                               const SizedBox(height: 10,),
                          if(cubit.task['startTime'] != '' || cubit.task['endTime'] != '' )
                            const  Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.watch_later_outlined,color: CupertinoColors.white,size: 33,),
                                    SizedBox(width: 15,),
                                    Text('Time',style: TextStyle(color: Colors.white,fontSize: 40),),
                                  ],
                                ),
                              ),
                              if(cubit.task['startTime'] == null || cubit.task['endTime'] == null  )
                                const SizedBox(height: 10,),
                              if(cubit.task['startTime'] != '' || cubit.task['endTime'] != '' )
                                  Padding(
                                padding:const EdgeInsets.all(8.0),
                                child:  Text( '${cubit.task['startTime']} - ${cubit.task['endTime']}'
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
