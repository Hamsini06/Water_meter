import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meter_app/ex.dart';
import 'package:meter_app/homescreen/homepage.dart';
import 'package:meter_app/register/signup.dart';
import 'package:meter_app/register/textfields.dart';
import 'package:meter_app/networking.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0,vertical: 20.0),
                      child: Text("Login",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  FieldText("Username/Email", secure: false,control: userNameController,validator: (value){
                    if(value!.isNotEmpty && value.contains(RegExp(r'[0-9]'))){
                      return "This field takes in only characters";
                    }
                    else if(value.isEmpty)
                      return"this field is required";
                  }, ),
                  FieldText("Password", secure: true, control: passwordController, validator: (value){
                    if(value!.isEmpty){
                      return"this field is required";
                    }
                    else if(value.length < 6){
                      return "this field requires atleast 6 characters";
                    }
                  },
                  ),

                  ButtonText(
                    colour: Colors.lightBlueAccent,
                    text: "Login",
                    onPressed: () async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
                      Map<dynamic, dynamic> message = await Network().postLoginData(userNameController.text,passwordController.text);
    if(message["statusCode"] == 200 && message["message"]!= " "){
      Navigator.pushNamed(context, Example.id);
    }
    else if(message["statusCode"] == 401){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Wrong username/password')));
      Timer(Duration(milliseconds: 3000), (){
        userNameController.clear();
        passwordController.clear();
      });
    }
    else{
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error')));
    }
                    }


                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, SignupScreen.id);
                        },
                        child: Text("Sign Up now!!",
                          style: TextStyle(
                              color: Colors.black
                          ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
