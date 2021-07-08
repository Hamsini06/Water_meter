import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water_meter_app/register/textfields.dart';


class SignupScreen extends StatefulWidget {
  static const String id = "signup_screen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  Text("Sign Up",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    FontAwesomeIcons.tint,
                    size: 40.0,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldText("First Name", secure: false),
                  FieldText("Last Name", secure: false),
                  FieldText("Username/Email", secure: false),
                  FieldText("Mobile Number", secure: false),
                  FieldText("Password", secure: true),
                  ButtonText(
                    colour: Colors.lightBlueAccent,
                      text: "Sign Up",
                    onPressed: (){},
                  ),
                ],
              ),
            ),
            
          ],
        ),

      ),
    );
  }
}

