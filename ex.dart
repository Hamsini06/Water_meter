import 'package:flutter/material.dart';
import 'package:water_meter_app/homescreen/homepage.dart';
import 'package:water_meter_app/homescreen/Graph.dart';
import 'package:water_meter_app/homescreen/Payment.dart';
import 'package:water_meter_app/homescreen/Profile.dart';


class Example extends StatefulWidget {
  static const id = "example";

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int current_index = 0;
  List <Widget> children = [
    HomeScreen(),
    GraphPage(),
    PayPage(),
    ProfilePage(),

  ];
  void tapped(int index){
    setState(() {
      current_index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue.shade200,
          fixedColor: Colors.white,
          onTap: tapped,
          type: BottomNavigationBarType.fixed,
        currentIndex: current_index, // this will be set when a new tab is tapped
    items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home",
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.auto_graph),
    label: "Graph"
    ),
      BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: "Payment"
      ),
    BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "profile"
    )
    ],
      ),
 body: children[current_index],

      )
    );
  }
}
