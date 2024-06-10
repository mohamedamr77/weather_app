import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/homeScreen/widget/circleTemprature/circle_temprature_text.dart';
import '../../../core/color.dart';
import '../../../cubit/getweathercubit/get_weather_cubit.dart';
import '../../../model/weathermodel.dart';

class HourlyForecastInTabBarView extends StatelessWidget {
  const HourlyForecastInTabBarView({super.key});

  String formatTime(DateTime time) {
    int hour = time.hour;
    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour; // convert 0 to 12 for midnight or noon
    return '$hour $period';
  }

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherModel.hourlyForecast.length,
        itemBuilder: (context, index) {
          HourlyForecast hourlyForecast = weatherModel.hourlyForecast[index];
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
              top: 10,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.17,
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
                      formatTime(hourlyForecast.time),
                      style: TextStyle(
                        color: ColorApp.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Image(image: NetworkImage("https:${hourlyForecast.image}")),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${hourlyForecast.temperature.round()}",
                        style: TextStyle(
                          color: ColorApp.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleTemprature(size: 25),
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
