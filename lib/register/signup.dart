import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meter_app/ex.dart';
import 'package:meter_app/homescreen/homepage.dart';
import 'package:meter_app/register/textfields.dart';
import 'package:meter_app/register/login.dart';
import 'package:meter_app/networking.dart';


class SignupScreen extends StatefulWidget {
  static const String id = "signup_screen";

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final aadhaarNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
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
    Form(
    key: _formKey,
    child: Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

    FieldText("First Name", secure: false, control: firstNameController, validator: (value){
    if(value!.isNotEmpty && value.contains(RegExp(r'[0-9]'))){
    return "This field takes in only characters";
    }
    else if(value.isEmpty)
    return"this field is required";
    },),
    FieldText("Last Name", secure: false,control: lastNameController,validator: (value){
    if(value!.isNotEmpty && value.contains(RegExp(r'[0-9]'))){
    return "This field takes in only characters";
    }
    else if(value.isEmpty)
    return"this field is required";
    },),
    FieldText("Username/Email", secure: false,control: userNameController,validator: (value){
      if(value!.isEmpty)
    return"this field is required";
    }, ),
    FieldText("Mobile Number", secure: false, control: numberController, validator: (value){
    if(value!.isNotEmpty && !value.contains(RegExp(r'[0-9]') )){
    return "This field takes in only numbers";
    }
    else if(value.length <10){
      return "This field requires 10 digits";
    }
    else if(value.isEmpty)
    return"this field is required";
    },
    type: TextInputType.number),
    FieldText("Aadhar Number", secure: false, control: aadhaarNumberController, validator: (value){
    if(value!.isEmpty){
    return"this field is required";
    }
    },
    ),
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
                          text: "Sign Up",
                        onPressed: () async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
                          Map<dynamic,dynamic> message = await Network().postSignData(firstNameController.text, lastNameController.text, userNameController.text, numberController.text, passwordController.text, aadhaarNumberController.text);
                          if(message["statusCode"] == 200 && message["message"]!= " "){
                            Navigator.pushNamed(context, Example.id);
                          }
                          else if(message["statusCode"] == 409){
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('This username already exists')));
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
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: Text("Login now!!",
                              style: TextStyle(
                                  color: Colors.black
                              ),),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

    )],
            ),
          ),
        ),

      ),
    );
  }
}
