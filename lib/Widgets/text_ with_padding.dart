import 'package:flutter/material.dart';





class TextWithPadding extends StatelessWidget {
const TextWithPadding({Key? key, required this.myText}) : super(key: key);
final String myText ;

  @override
  Widget build(BuildContext context) {

return  Padding(
      padding:const EdgeInsets.all(8.0),
      child:  Text(myText
        ,  style: const TextStyle(
            color: Colors.white,
            fontSize: 30
        ),),
    );

  }
}
