import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/image.dart';
import 'package:weather/features/BottomNavigationbar/screen.dart';
import 'package:weather/model/weathermodel.dart';
import 'package:weather/service/weather_service.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Center(
          child: Text("Search a City",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        leading: SizedBox(),
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.backGroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child:  Container(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          width: double.infinity,
          child: TextFormField(
            onFieldSubmitted: (value)  {

              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),));

            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              hintText: "Search for a city",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              labelText: "search",
              labelStyle: TextStyle(color: Colors.orange),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.orange,
                ),
              ),
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              suffixIcon:Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}