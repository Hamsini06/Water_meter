import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:water_meter_app/register/login.dart';
import 'package:water_meter_app/register/textfields.dart';
import 'package:water_meter_app/Database_helper.dart';

class SignupScreen extends StatefulWidget {
  static const String id = "signup_screen";


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final dbHelper = DatabaseHelper.instance;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();

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

                  FieldText("First Name", secure: false, control: firstNameController),
                  FieldText("Last Name", secure: false,control: lastNameController ),
                  FieldText("Username/Email", secure: false,control: userNameController),
                  FieldText("Mobile Number", secure: false, control: numberController ),
                  FieldText("Password", secure: true, control: passwordController),
                  ButtonText(
                    colour: Colors.lightBlueAccent,
                    text: "Sign Up",
                   onPressed: (){
                      final id = _insert();
                      if(id != null) {
                        Navigator.pushNamed(context, LoginScreen.id);
                      }

                   }
                  ),
                  // ButtonText(
                  //     colour: Colors.lightBlueAccent,
                  //     text: "blah",
                  //     onPressed: (){
                  //       _query();
                  //
                  //     }
                  // ),
                ],
              ),
            ),

          ],
        ),

      ),

    );
  }
  Future _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.firstName: firstNameController.text,
      DatabaseHelper.lastName: lastNameController.text,
      DatabaseHelper.userName: userNameController.text,
      DatabaseHelper.mobNum: numberController.text,
      DatabaseHelper.password: passwordController.text,
    };
    final id = await dbHelper.insert_data(DatabaseHelper.table,row);
    print('inserted row id: $id');
    return id;
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows: $allRows');

  }
}
