import 'package:flutter/material.dart';
import 'package:weather/core/color.dart';
import 'package:weather/features/homeScreen/widget/circleTemprature/circle_temprature_text.dart';

class AvgTemperature extends StatelessWidget {
  const AvgTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.3,
          child: Text(
            '19',
            style: TextStyle(
              color: ColorApp.whiteColor,
              fontSize: MediaQuery.of(context).size.height*0.1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CircleTemprature(size: MediaQuery.of(context).size.height*0.09,)
      ],
    );
  }
}
