import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Widgets/text_%20with_padding.dart';
import 'package:note_app/Widgets/text_and_icon.dart';
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
                              // Title
                             const IconAndText(text: 'Title', icon: Icons.title),
                           TextWithPadding(myText: cubit.task['title'].toString()),

                              //description
                          const IconAndText(text: 'Description', icon: Icons.file_copy_outlined),
                            TextWithPadding(myText: cubit.task['description'].toString()),

                              //date
                            const IconAndText(text: 'Date', icon: Icons.calendar_month_sharp),
                            TextWithPadding(myText: cubit.task['date'].toString()),

                              //time
                             if(cubit.task['startTime'] == null || cubit.task['endTime'] == null  )
                               const SizedBox(height: 10,),
                          if(cubit.task['startTime'] != '' || cubit.task['endTime'] != '' )
                            const  IconAndText(text: 'Time', icon: Icons.watch_later_outlined),

                              if(cubit.task['startTime'] == null || cubit.task['endTime'] == null  )
                                const SizedBox(height: 10,),
                              if(cubit.task['startTime'] != '' || cubit.task['endTime'] != '' )
                                TextWithPadding(myText: '${cubit.task['startTime']} - ${cubit.task['endTime']}'),

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
