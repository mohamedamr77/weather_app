import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/color.dart';
import 'package:weather/features/initalscreen/screen.dart';
import 'package:weather/features/searchscreen/screen.dart';

import '../../../cubit/getweathercubit/get_weather_cubit.dart';
import '../../../model/weathermodel.dart';
class CityName extends StatelessWidget {
  const CityName({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
    BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Text(
       weatherModel.city,
      style: TextStyle(
        color: ColorApp.whiteColor,
        fontSize: MediaQuery.of(context).size.height*0.05,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
