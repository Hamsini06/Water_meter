import 'package:flutter/material.dart';
import 'package:water_meter_app/register/login.dart';
import 'package:water_meter_app/register/signup.dart';

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    onPressed: (){
                    Navigator.pushNamed(context, SignupScreen.id);
                    },
                    child: Text("Sign Up",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white
                    ),),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text("Log In",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
