// @dart=2.9

import 'package:flutter/material.dart';
import 'package:meter_app/register/welcome_screen.dart';
import 'package:meter_app/register/login.dart';
import 'package:meter_app/register/signup.dart';
import 'package:meter_app/homescreen/homepage.dart';
import 'package:provider/provider.dart';
import 'networking.dart';
import 'ex.dart';



dynamic token;
void main() async {
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context)=> Data(),
      child: MaterialApp(
        initialRoute: WelcomeScreen.id ,
        routes: {
          Example.id: (context) => Example(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomeScreen.id: (context) => HomeScreen(),

        },
      ),
    );
  }


}
