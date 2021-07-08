import 'package:flutter/material.dart';
import 'package:water_meter_app/register/login.dart';
import 'package:water_meter_app/register/signup.dart';
import 'textfields.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Text(
                  "Water Meter",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),

              ),
            ),
            ButtonText(
              colour: Colors.blueAccent,
              text: 'Sign up',
              onPressed: (){
                Navigator.pushNamed(context, SignupScreen.id);
              },
            ),
      ButtonText(
        colour: Colors.lightBlueAccent,
        text: 'Log In',
        onPressed: (){
          Navigator.pushNamed(context, LoginScreen.id);
        },
      ),
          ],
        ),

      ),
    );
  }
}

