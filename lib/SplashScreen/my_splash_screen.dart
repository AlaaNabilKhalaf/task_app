import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Screens/HomeScreen.dart';
import '../Constants/colors.dart';
import '../cubits/hive_cubit/hive_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    Future.delayed(const Duration(seconds:3),(){
      Navigator.pushReplacement(context, MaterialPageRoute
        (builder: (context)=> const HomeScreen()));
      Future.delayed(const Duration(milliseconds: 100),(){
          BlocProvider.of<HiveCubit>(context).makeAnimationValueTure();
          Future.delayed(const Duration(milliseconds: 400),(){
            BlocProvider.of<HiveCubit>(context).changeAnimationValue();
          });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GestureDetector(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute
            (builder: (context)=> const HomeScreen()));
          Future.delayed(const Duration(milliseconds: 100),(){
            BlocProvider.of<HiveCubit>(context).makeAnimationValueTure();
            Future.delayed(const Duration(milliseconds: 500),(){
              BlocProvider.of<HiveCubit>(context).changeAnimationValue();
            });
          });},
        child: Scaffold(
          backgroundColor: myPrimeColor,
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Expanded(child: Center(
                  child:
                  Image.asset('lib/assets/images/PngItem_630638.png',
                    fit: BoxFit.cover,
                    height:MediaQuery.of(context).size.width*0.4,
                  ),
                )),
                const Text('Task App',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
