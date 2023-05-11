import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/Screens/Home_Screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 await Hive.openBox('Tasks');
  runApp(const ThemingApp());
}

class ThemingApp extends StatefulWidget {
  const ThemingApp({super.key});

  static _ThemingAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_ThemingAppState>()!;
  @override
  State<ThemingApp> createState() => _ThemingAppState();
}

class _ThemingAppState extends State<ThemingApp> {
  bool isMode = true;


  void changeMode(){
    setState(() {});
    isMode = !isMode;
  }

  final tasksRef = Hive.box('Tasks');
  List<Map<String,dynamic>> tasksData= [];

  void addTask
      ({required title,
    required description ,
    required startTime ,
    required endTime ,
  required date,
  required color}) async {
    await tasksRef.add({
      'title' : title,
      'description' : description,
      'startTime' : startTime,
      'endTime' : endTime,
      'date' : date,
      'color' : color
    });
    print('task added');
  }

  List<Map<String,dynamic>> getTask({required String date}) {
    List<Map<String,dynamic>> list=[];
    final keys = tasksRef.keys;
    for (final key in keys) {
      final task = tasksRef.get(key);
      if (task['date'] == date) {
        final mapTask = {
          'key': key,
          'title': task['title'],
          'startTime': task['startTime'],
          'endTime': task['endTime'],
          'description': task['description'],
          'color' : task['color'],
        };
        list.add(mapTask);
        print(list[0]);
      }
    }
    tasksData = list;
    return list;
  }

  //  getTasks ({ required myData}) {
  //   setState(() {
  //     tasksData = tasksRef.keys.map((e) {
  //       final currentTask = tasksRef.get(e);
  //       return{
  //         'key': e,
  //         'title' : currentTask['title'],
  //         'description' : currentTask['description'],
  //         'startDate' : currentTask['startData'],
  //         'endDate' : currentTask['endData'],
  //         'data' : currentTask['data']
  //       };
  //     }).toList();
  //     debugPrint(tasksData.length.toString());
  //     debugPrint(tasksData.toString());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isMode? ThemeMode.light : ThemeMode.dark ,
      debugShowCheckedModeBanner: false,
      home:const HomeScreen(),
    );
  }

}


