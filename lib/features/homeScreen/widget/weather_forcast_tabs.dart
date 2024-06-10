import 'package:flutter/material.dart';
import 'package:weather/core/color.dart';
import 'package:weather/core/image.dart';
import 'package:weather/core/text.dart';
import 'hourly_forecast_in_tabbarview.dart';
import 'weather_forcast_widget/weekly_forecast_in_tabbarview.dart';

class WeatherForecastTabs extends StatefulWidget {
  const WeatherForecastTabs({super.key});

  @override
  State<WeatherForecastTabs> createState() => _WeatherForecastTabsState();
}

class _WeatherForecastTabsState extends State<WeatherForecastTabs> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Home photo put in background
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.505,
          child: Image(image: AssetImage(ImageApp.houseImage)),
        ),
        Positioned(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorApp.midnightBlueColor.withOpacity(0.9),
                  ColorApp.deepBlueColor.withOpacity(0.9),
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 65,
                  child: TabBar(
                    labelColor: ColorApp.purpleColor,
                    unselectedLabelColor: ColorApp.greyLightColor,
                    controller: tabController,
                    tabs: [
                      Tab(text: TextApp.hourlyForecastText),
                      Tab(text: TextApp.weeklyForecastText),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      HourlyForecastInTabBarView(),
                      WeeklyForecastInTabBarView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
