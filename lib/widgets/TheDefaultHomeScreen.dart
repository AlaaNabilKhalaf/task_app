import 'package:flutter/material.dart';

class MyDefaultHomeScreen extends StatelessWidget {
  const MyDefaultHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/images/—Pngtree—blue mobile phone layout free_4404519.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height*0.25,
            width: MediaQuery.of(context).size.width*0.35,),
          const Text("You don't have any tasks yet",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 19
            ),),
          const  Text("Add new tasks to make your day productive",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 17
            ),),
        ],
      ),
    );
  }
}
