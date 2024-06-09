import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/getweathercubit/get_weather_cubit.dart';
import 'package:weather/cubit/getweathercubit/get_weather_state.dart';
import 'package:weather/features/homeScreen/views/data_found.dart';
import 'package:weather/features/homeScreen/views/data_notfound.dart';
import 'package:weather/features/homeScreen/views/errorscreen.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
    bool weatherModel=true ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // ignore: unnecessary_null_comparison
      body: BlocBuilder<GetWeatherCubit,WeatherState>
        (
        builder: (BuildContext context, state) {
        if(state is WeatherInfoCorrectState){
          return  DataFoundScreen();
        }
        else if (state is WeatherInfoIncorrectState) {
          return ErrorScreen();
        }else{
         return const DataNotFoundScreen();
        }
      },)
    );
  }
}
