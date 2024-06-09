import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/text.dart';
import 'package:weather/features/homeScreen/widget/circleTemprature/circle_temprature_text.dart';

import '../../../core/color.dart';
import '../../../cubit/getweathercubit/get_weather_cubit.dart';
import '../../../model/weathermodel.dart';

class HighLowTemperature extends StatelessWidget {
  const HighLowTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${TextApp.highText} : ${weatherModel.maxTemperature.round()}",
          style: TextStyle(
            color:  ColorApp.whiteColor,
            fontSize: MediaQuery.of(context).size.height*0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleTemprature(size: MediaQuery.of(context).size.height*0.034,),
       const SizedBox(width: 10,),
        Text("${TextApp.lowText} : ${weatherModel.minTemperature.round()}",
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
