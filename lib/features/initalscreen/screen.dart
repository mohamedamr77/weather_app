import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/color.dart';
import 'package:weather/core/image.dart';
import 'package:weather/core/text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/features/BottomNavigationbar/screen.dart';
class InitalScreen extends StatefulWidget {
  const InitalScreen({super.key});

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can continue accessing the position of the device.
    if(permission==LocationPermission.whileInUse) {
      //if person not move
      Position position=await Geolocator.getCurrentPosition();
      print(position.latitude);
      print(position.longitude);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            //BACKGROUND
            image: AssetImage(ImageApp.backGroundImage,),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Image(image: AssetImage(ImageApp.iconInitalScreenImage),
              ),
            ),

            Expanded(
              flex: 1,
              child: Image.asset(ImageApp.textWeatherForeCastImage,
                width: MediaQuery.of(context).size.width*0.7,
              ),),

            GestureDetector(
              onTap: () async {
                try {
                  await getCurrentLocation();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()));
                } catch (e) {
                  // Handle the error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text(e.toString()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:  ColorApp.goldenYellowColor,
                ),
                child: const Center(child: Text(TextApp.getStartedText,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorApp.textInInitalScreenColor,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
