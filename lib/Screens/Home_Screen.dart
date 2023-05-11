import 'dart:io';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Screens/Task_screen.dart';
import 'package:note_app/Screens/add_task_screen.dart';
import 'package:note_app/constances/colors.dart';
import 'package:note_app/main.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String myDate ;
  String cornerText = 'TODO';
  File? image ;
  Future pickImage() async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null)return;
    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemingApp.of(context).isMode? Colors.white : Colors.black,
      leading:
      IconButton(
      onPressed: (){
        setState(() {
        });
        ThemingApp.of(context).changeMode();
      },
        icon: Icon(ThemingApp.of(context).isMode? Icons.nightlight_round : Icons.sunny,
            color: myPrimeColor),),
        actions: [
  GestureDetector(
    onTap: () {
      try{pickImage();}catch(e){
        print('the erroe is $e');
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
        child: image == null ? const Icon(Icons.person,size: 30,)  :
        Image.file(image!,height: 40,width: 40,fit: BoxFit.cover,),
      ),
    ),
  )
        ],
      ),
      backgroundColor: ThemingApp.of(context).isMode? Colors.white : Colors.black,
      body:
      Column(
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
                        child: Text(DateFormat.yMMMMd().format(DateTime(2023)),
                          style: const TextStyle(
                              fontSize: 30,
                              color: Colors.grey
                          ),),
                      ),
                       Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Today',style: TextStyle(
                            color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                            fontSize: 30
                        ),),
                      )
                    ]
                ),
                MaterialButton(onPressed: ()
                {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const
                 AddTask()));
                 setState(() {
                   print(" I'm going to screen two");
                 });
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
     color : ThemingApp.of(context).isMode? Colors.white : Colors.black,
   ),
    child: DatePicker(
    DateTime.now(),
    width: MediaQuery.of(context).size.width*0.23,
      height: MediaQuery.of(context).size.height*0.6,
      initialSelectedDate: DateTime.now(),
    selectionColor: myPrimeColor,
    selectedTextColor: ThemingApp.of(context).isMode?  Colors.black : Colors.white ,
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
    myDate = DateFormat.yMMMMd().format(data);
    ThemingApp.of(context).getTask(date: myDate.toString());
    print(ThemingApp.of(context).getTask(date: myDate).toString());
    print('success');

    setState(() {
      print(myDate);
    });
    },),),),

          ThemingApp.of(context).tasksData.isEmpty?
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
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.separated(
                      itemBuilder: (context , index){
                        return
                        Container(
                          height:MediaQuery.of(context).size.width*0.30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(ThemingApp.of(context).tasksData[index]['color']??5555),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              width: 1,
                              color: Colors.black
                            )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                      flex: 7,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const TaskScreen()));
                                        },
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(ThemingApp.of(context).tasksData[index]['title'],
                                                  style: const TextStyle(
                                                  fontSize: 19,fontWeight: FontWeight.bold
                                                ),),
                                                Row(
                                                  children: [Icon(Icons.watch_later_outlined,
                                                     color: ThemingApp.of(context).isMode? Colors.black : Colors.white,
                                                     size: 20,),
                                                    Text(' ${ThemingApp.of(context).tasksData[index]['startTime'].toString()}'),
                                                   const Text(' - '),
                                                    Text(ThemingApp.of(context).tasksData[index]['endTime'].toString()),
                                                  ],
                                                ),
                                                Text(ThemingApp.of(context).tasksData[index]['description'],style: const TextStyle(
                                                    fontSize: 18
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
                                             ThemingApp.of(context).tasksData[index]['taskState'] = 'Completed';
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

                                            MaterialButton(onPressed: (){
                                              Navigator.pop(context);
                                              setState(() {});
                                            },
                                              elevation: 8,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12)
                                              ),
                                              minWidth:double.infinity,
                                              height: MediaQuery.of(context).size.height*0.06,
                                              child: const Text('Close',
                                                style: TextStyle(color: Colors.black,
                                                    fontSize: 20),),
                                            ),

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
                                    child: Text(ThemingApp.of(context).tasksData[index]['taskState'].toString(),
                                      style: const TextStyle(
                                  fontSize: 18
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
                      itemCount: ThemingApp.of(context).tasksData.length),
                ),
              )

        ],
      ),

    );
  }
}
