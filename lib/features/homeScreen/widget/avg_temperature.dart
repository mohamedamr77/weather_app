import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/color.dart';
import 'package:weather/features/homeScreen/widget/circleTemprature/circle_temprature_text.dart';

import '../../../cubit/getweathercubit/get_weather_cubit.dart';
import '../../../model/weathermodel.dart';

class AvgTemperature extends StatelessWidget {
  const AvgTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${weatherModel.averageTemperature.round()}",
          style: TextStyle(
            color: ColorApp.whiteColor,
            fontSize: MediaQuery.of(context).size.height*0.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleTemprature(size: 72),
      ],
    );
  }
}

/*
Text(
            "${weatherModel.averageTemperature.round()}",
            style: TextStyle(
              color: ColorApp.whiteColor,
              fontSize: MediaQuery.of(context).size.height*0.1,
              fontWeight: FontWeight.bold,
            ),
          ),
 */