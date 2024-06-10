import 'package:flutter/material.dart';
import '../../../core/image.dart';
import '../widget/avg_temperature.dart';
import '../widget/city_name.dart';
import '../widget/high_low_temperature.dart';
import '../widget/temperature_conditions.dart';
import '../widget/weather_forcast_tabs.dart';

class DataFoundScreen extends StatelessWidget {
  const DataFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.backGroundImage,),
            fit:BoxFit.cover,
          )
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:  MediaQuery.of(context).size.height*0.1,),
            CityName(),
            AvgTemperature(),
            TemperatureConditions(),
            HighLowTemperature(),
            WeatherForecastTabs(),
          ],
        ),
      ),
    );
  }
}
