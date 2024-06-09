import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/getweathercubit/get_weather_cubit.dart';
import 'features/initalscreen/screen.dart';
import 'service/weather_service.dart';

void main() {
  runApp(MyApp());
  WeatherService(dio: Dio()).getWeather(city: "cairo");
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        home: InitalScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}