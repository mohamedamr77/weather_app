import 'package:flutter/material.dart';
import 'package:weather/features/homeScreen/views/data_found.dart';
import 'package:weather/features/homeScreen/views/data_notfound.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
    bool weatherModel=true ;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      // ignore: unnecessary_null_comparison
      body: weatherModel==false ? DataNotFoundScreen(): DataFoundScreen(),
    );
  }
}
