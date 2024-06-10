import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/color.dart';
import 'package:weather/core/image.dart';
import 'package:weather/cubit/getweathercubit/get_weather_cubit.dart';
import 'package:weather/features/BottomNavigationbar/screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? selectedCity;
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple[700],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: SafeArea(
              child: Center(
                child: Text(
                  "Search a City",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageApp.backGroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Lottie.asset(
                      'assets/images/locationsearch.json',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50,
                        horizontal: 20,
                      ),
                      width: double.infinity,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        onFieldSubmitted: (cityName) {
                          BlocProvider.of<GetWeatherCubit>(context).getWeather(city: cityName);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavigationBarScreen(),
                            ),
                          );
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                          hintText: "Search for a city",
                          hintStyle: TextStyle(
                            color: Colors.white24,
                          ),
                          labelText: "search",
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:Color(0xffcE93D8),
                            ),
                          ),
                          suffixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
