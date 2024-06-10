import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/getweathercubit/get_weather_cubit.dart';
import 'features/initalscreen/screen.dart';

void main() {
  runApp(MyApp());
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