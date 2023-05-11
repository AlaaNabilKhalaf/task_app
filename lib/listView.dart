import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/Constants/colors.dart';
import 'package:note_app/cubits/hive_cubit/hive_cubit.dart';

class MyListView extends StatelessWidget {
 const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HiveCubit>(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.255,
      width: MediaQuery.of(context).size.width*0.2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
              return GestureDetector(
                onTap: (){
                  cubit.changeContainerColorMethod(index: index);
                  cubit.insertImageTask(taskImage: cubit.images[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(cubit.images[index],),
                            fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          width: 5,
                          color: cubit.selectedIndex == index ? myPrimeColor : cubit.isMode ? Colors.white: Colors.black,
                        )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: myPrimeColor
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(cubit.text[index],
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          ),),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder:(context , index)=> const SizedBox(width: 10,) ,
            itemCount:cubit.images.length ),
      ),
    );
  }
}
