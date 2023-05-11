import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Constants/colors.dart';
import '../cubits/hive_cubit/hive_cubit.dart';

class MyTap extends StatefulWidget {
  const MyTap({Key? key}) : super(key: key);

  @override
  State<MyTap> createState() => _MyTapState();
}

class _MyTapState extends State<MyTap> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HiveCubit>(context);
    return
      MaterialButton(
        onPressed: () async {
      //   Alert(context: context, title: "FLUTTER", desc: "Flutter is awesome.").show();
      cubit.makeAnimationValueTure();
      if(cubit.date.text.isEmpty){
        Alert(
          style: AlertStyle(
              alertAlignment: Alignment.bottomCenter,
            descStyle: TextStyle(
              color: myPrimeColor
            )
          ),
          context: context,
          type: AlertType.info,
          title: "WAIT",
          desc: "You Need To Enter Your Task Date First",
          buttons: [
            DialogButton(
              color: myPrimeColor,
              onPressed: () => Navigator.pop(context),
              width: 125,
              child: const Text(
                "GOT IT",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
        ).show();}

      else{
        Navigator.pop(context);
        await cubit.addTask(
          context: context,
          taskState: 'TODO',
          taskImage: cubit.imageOfTheTask,
          title: cubit.title.text,
          color: cubit.containerColor,
          description: cubit.description.text,
          endTime: cubit.endTime.text,
          startTime: cubit.startTime.text,
          date : cubit.date.text,
          containerText: cubit.containerText
        );
      }
      Future.delayed(const Duration(milliseconds: 500),(){
        setState(() {
          cubit.startAnimated = true;
          Future.delayed(const Duration(milliseconds: 500),(){
            cubit.startAnimated = ! cubit.startAnimated ;
          });
        });
      });
    },
      color: myPrimeColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)),
      minWidth:MediaQuery.of(context).size.width*.35,
      height: MediaQuery.of(context).size.height*0.06,
      child: const Text('Create Task',
        style: TextStyle(color: Colors.white,
            fontSize: 20),),);
  }
}
