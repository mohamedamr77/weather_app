import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/weathermodel.dart';

class WeatherService{
  final Dio dio;
  WeatherService({required this.dio});
  final  String basedUrl= "http://api.weatherapi.com/v1" ;
  final  String apiKey= "5541ba7213f1438f959123924242805";

  getWeather({required String city }) async{
    Response response =await dio.get("$basedUrl/forecast.json?key=$apiKey&q=$city&days=7&aqi=no&alerts=no");
    //http://api.weatherapi.com/v1/forecast.json?key=5541ba7213f1438f959123924242805&q=tanta&days=7&aqi=no&alerts=no
    try
    {
      WeatherModel weatherModel=WeatherModel.fromJson(response.data);
      print(weatherModel);
      return weatherModel;
    } on DioException catch(e){
      final String errorMessage=e.response?.data["error"]["message"] ??" OOPS FOUND PROBLEM TRY AFTER SOME MINUTE WE TRY TO SOLVE PROBLEM ";
      throw Exception(errorMessage);
    }
    catch(e){
      log(e.toString()); //work in debug
      throw Exception("Try Later we found problem and solve it ");
    }
  }
}