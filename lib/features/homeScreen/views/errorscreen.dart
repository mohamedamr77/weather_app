import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/image.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration:const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageApp.backGroundImage,),
              fit:BoxFit.cover,
            )
        ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
          Lottie.asset("assets/images/errorlottie.json"),
             Text("Please Enter The Correct City In Search ",
             style: TextStyle(
               color: Colors.white,
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
             )
           ],
         ),
      ),
    );
  }
}
