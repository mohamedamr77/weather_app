import 'package:flutter/material.dart';
import 'package:weather/core/text.dart';
import 'package:weather/features/homeScreen/widget/circleTemprature/circle_temprature_text.dart';

import '../../../core/color.dart';

class HighLowTemperature extends StatelessWidget {
  const HighLowTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${TextApp.highText} : 24",
          style: TextStyle(
            color:  ColorApp.whiteColor,
            fontSize: MediaQuery.of(context).size.height*0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleTemprature(size: MediaQuery.of(context).size.height*0.034,),
       const SizedBox(width: 10,),
        Text("${TextApp.lowText} : 18",
          style: TextStyle(
            color:  ColorApp.whiteColor,
            fontSize: MediaQuery.of(context).size.height*0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleTemprature(size: MediaQuery.of(context).size.height*0.034,),
      ],
    );
  }
}
