import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/constances/colors.dart';
import '../main.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: ThemingApp.of(context).isMode? Colors.white : Colors.black,
          elevation: 0,
        ),
        backgroundColor: ThemingApp.of(context).isMode? Colors.white : Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
             const Text('Hello, LOLO',style: TextStyle(
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

                         const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text('Learn Flutter', style: TextStyle(
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
                      const  Padding(
                          padding: EdgeInsets.all(8.0),
                          child:  Text('The Description',  style: TextStyle(
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
                          const     Padding(
                            padding: EdgeInsets.all(8.0),
                            child:  Text('26 May 2023',  style: TextStyle(
                                color: Colors.white,
                                fontSize: 30
                            ),),
                          ),
        //time
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: const [
                                Icon(Icons.calendar_month_sharp,color: CupertinoColors.white,size: 33,),
                                SizedBox(width: 15,),
                                Text('Time',style: TextStyle(color: Colors.white,fontSize: 40),),
                              ],
                            ),
                          ),
                     const     Padding(
                            padding: EdgeInsets.all(8.0),
                            child:  Text('9:00 pm - 10:00 pm',  style: TextStyle(
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
      );
  }
}
