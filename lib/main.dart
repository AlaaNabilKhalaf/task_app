import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:note_app/SplashScreen/my_splash_screen.dart';
import 'package:note_app/cubits/hive_cubit/hive_cubit.dart';
import 'package:note_app/cubits/hive_cubit/hive_states.dart';
import 'bloc_observer/bloc_observer.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
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


  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=> HiveCubit(),
      child: BlocConsumer<HiveCubit,HiveStates>(
        listener: (context , state){},
        builder: (context , state ) {
          return  MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: BlocProvider.of<HiveCubit>(context).isMode? ThemeMode.light : ThemeMode.dark ,
            debugShowCheckedModeBanner: false,
            home:const SplashScreen(),
          );
        }
      ),
    );
  }

}


