import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.controller, required this.myText}) : super(key: key);
final TextEditingController controller ;
final String myText ;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      decoration: InputDecoration(
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
    );
  }
}
