import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/hive_cubit/hive_cubit.dart';

class TheText extends StatefulWidget {
  const TheText({Key? key,
  required this.myText}) : super(key: key);
 final String myText ;

  @override
  State<TheText> createState() => _TheTextState();
}

class _TheTextState extends State<TheText> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HiveCubit>(context);
setState(() {
});
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(widget.myText ,style: TextStyle(
          color: cubit.isMode? Colors.black : Colors.white,
          fontSize: 20
      ),),
    );
  }
}
