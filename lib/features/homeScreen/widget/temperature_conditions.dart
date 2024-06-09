import 'package:flutter/material.dart';
import 'package:weather/core/color.dart';

class TemperatureConditions extends StatelessWidget {
  const TemperatureConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Mostly Clear ",
      style: TextStyle(
        color: ColorApp.greyLightColor,
        fontSize: MediaQuery.of(context).size.height*0.035,
      ),
    );
  }
}
