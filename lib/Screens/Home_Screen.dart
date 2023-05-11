import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        icon: Icon(ThemingApp.of(context).isMode? Icons.nightlight_round : Icons.sunny,color: Colors.grey.withOpacity(0.5)),),
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
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddTask()));
                 setState(() {
                   print(" I'm going to screen two");
                 });
                },
                  color: myBlue,
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
    selectionColor: myBlue,
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
                  padding: const EdgeInsets.all(8.0),
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
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(ThemingApp.of(context).tasksData[index]['title'],style: const TextStyle(
                                color: Colors.black,
                                  fontSize: 20
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(ThemingApp.of(context).tasksData[index]['description'],style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20
                                ),),
                              ),

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
