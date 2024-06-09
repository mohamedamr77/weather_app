import 'package:flutter/material.dart';
import '../../../../core/color.dart';

class CircleTemprature extends StatelessWidget {
  const CircleTemprature({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      "°",
      style: TextStyle(
        color:  ColorApp.whiteColor,
        fontSize: size,
      ),
    );
  }
}
