import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/color.dart';

import '../../../../core/image.dart';
import '../../../../cubit/getweathercubit/get_weather_cubit.dart';
import '../../../../model/weathermodel.dart';
import '../circleTemprature/circle_temprature_text.dart';

class WeeklyForecastInTabBarView extends StatelessWidget {
  const WeeklyForecastInTabBarView({super.key});

  String getDayOfWeek(DateTime date) {
    // Get the name of the day for the given date
    return [ "Saturday","Sunday", "Monday", "Tuesday", "Wednes", "Thursday", "Friday",][date.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherModel.dailyForecast.length,
        itemBuilder: (context, index) {
          DailyForecast dailyForecast = weatherModel.dailyForecast[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
              top: 10,
            ),
            child: Container(
               width: //getDayOfWeek(dailyForecast.date)=="Wednesday"? MediaQuery.of(context).size.width * 0.21:
              MediaQuery.of(context).size.width * 0.17
              ,
              decoration: BoxDecoration(
                color: ColorApp.deepVioletColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      getDayOfWeek(dailyForecast.date)=="Wednes"?
                      "${ getDayOfWeek(dailyForecast.date)} \n day":
                      getDayOfWeek(dailyForecast.date),
                     textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ColorApp.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Image.network(
                    "https:${ dailyForecast.image}",
                    width: 40,
                    height: 40,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${dailyForecast.temperature.round()}",
                        style: const TextStyle(
                          color: ColorApp.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CircleTemprature(size: 25),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
