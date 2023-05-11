import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Constants/colors.dart';
import 'package:note_app/cubits/hive_cubit/hive_cubit.dart';

class MyListView extends StatelessWidget {
 const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HiveCubit>(context);
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            border: Border.all(
              width: 4,
            )
          ),
          child: Image.asset(cubit.images[index],),
        ),
      );
    },
        separatorBuilder:(context , index)=> const SizedBox(width: 10,) ,
        itemCount:cubit.images.length );
  }
}
