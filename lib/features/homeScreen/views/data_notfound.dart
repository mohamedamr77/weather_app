import 'package:flutter/material.dart';
import '../../../core/image.dart';
import '../../../core/text.dart';


class DataNotFoundScreen extends StatelessWidget {
  const DataNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.backGroundImage,),
            fit:BoxFit.cover,
          )
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
