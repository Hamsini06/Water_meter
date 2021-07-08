import 'package:flutter/material.dart';
import 'package:water_meter_app/register/welcome_screen.dart';
import 'package:water_meter_app/register/login.dart';
import 'package:water_meter_app/register/signup.dart';


void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id : (context) => SignupScreen()

      },
    );
  }
}


