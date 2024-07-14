import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/getweathercubit/get_weather_state.dart';
import 'package:weather/model/weathermodel.dart';
import 'package:weather/service/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherInitialState());
   late WeatherModel weatherModel;
   getWeather ({required String city})async{

      try {
        weatherModel=await  WeatherService(dio: Dio()).getWeather(city: city);
        emit(WeatherInfoCorrectState());
      }
      catch(e){
          emit(WeatherInfoIncorrectState());
      }
 }
}