import 'package:flutter/material.dart';
import 'package:weather/features/homeScreen/screen.dart';
import 'package:weather/features/searchscreen/screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int currentIndex=0;
  List<Widget> displayScreen=[
    HomeScreen(),
    SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: displayScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: Colors.deepPurple[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search",
          ),
        ],
      ),
    );
  }
}
