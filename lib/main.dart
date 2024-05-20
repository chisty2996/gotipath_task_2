import 'package:flutter/material.dart';
import 'package:gotipath_task/custom_notch.dart';
import 'package:gotipath_task/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,


      body: WeatherScreen(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          // Handle FAB press
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurpleAccent.withOpacity(0.6),
        shape: const CustomNotch(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.anchor, color: Colors.white,),
              onPressed: () => _onItemTapped(0),
            ),
            SizedBox(width: 48), // Space for the FAB
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white,),
              onPressed: () => _onItemTapped(1),
            ),
          ],
        ),
      ),
    );
  }
}