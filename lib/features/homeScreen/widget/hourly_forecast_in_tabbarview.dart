import 'package:flutter/material.dart';
import 'package:weather/core/image.dart';
import 'package:weather/features/homeScreen/widget/circleTemprature/circle_temprature_text.dart';
import '../../../core/color.dart';
class HourlyForecastInTabBarView extends StatelessWidget {
  const HourlyForecastInTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
              top: 10,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width*0.17,
              //height: MediaQuery.of(context).size.height*1,
              decoration: BoxDecoration(
                color: ColorApp.deepVioletColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(30),
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: 12),
                    child: Text( "12 AM" ,
                      style: TextStyle(
                        color: ColorApp.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Image(image: AssetImage(ImageApp.moonCloudMidRainImage)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "12",
                        style: TextStyle(
                          color: ColorApp.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      CircleTemprature(size: 25),
                    ],
                  )
                ],
              ),
            ),
          ),
          //separatorBuilder: (context, index) => SizedBox(width: 10,),
          itemCount: 10,
      ),
    );
  }
}
