 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconAndText extends StatelessWidget {
const IconAndText({Key? key , required this.text, required this.icon}) : super(key: key);
final IconData icon ;
final String text ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(

        children:  [
          Icon(icon,color: CupertinoColors.white,size: 33,),
        const  SizedBox(width: 15,),
          Text(text,style: const TextStyle(color: Colors.white,fontSize: 40),),
        ],
      ),
    );
  }
}
