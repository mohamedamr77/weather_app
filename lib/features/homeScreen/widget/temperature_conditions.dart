import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/color.dart';

import '../../../cubit/getweathercubit/get_weather_cubit.dart';
import '../../../model/weathermodel.dart';

class TemperatureConditions extends StatelessWidget {
  const TemperatureConditions({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Text("${weatherModel.conditionTemp} ",
      style: TextStyle(
        color: ColorApp.greyLightColor,
        fontSize: MediaQuery.of(context).size.height*0.035,
      ),
    );
  }
}
