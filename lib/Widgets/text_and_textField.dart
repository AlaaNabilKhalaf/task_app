import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants/colors.dart';
import '../cubits/hive_cubit/hive_cubit.dart';
import 'adding_task_text.dart';

class TextAndTextField extends StatelessWidget {
  const TextAndTextField({Key? key,
  required this.time,
  required this.myText,}) : super(key: key);
 final TextEditingController time ;
 final String myText ;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HiveCubit>(context);

    return   Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
       TheText(myText: myText ),
          TextField(
            keyboardType: TextInputType.none,
            onTap: (){
              showTimePicker(context: context,
                  initialTime: TimeOfDay.now()).then((value) {
                time.text = value!.format(context);
              });},
            controller: cubit.startTime,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.watch_later_outlined,
                  color: myPrimeColor,),
                hintText: 'Enter $myText Here',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                )
            ),
          ),


        ],
      ),
    );
  }
}
