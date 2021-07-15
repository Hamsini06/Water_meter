import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class _SignupScreenState extends State<SignupScreen>  {
bool isValidated = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
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
                          if(value!.isNotEmpty && value.contains(RegExp(r'[0-9]'))){
                            return "This field takes in only characters";
                          }
                          else if(value.isEmpty)
                            return"this field is required";
                        }, ),
                        FieldText("Mobile Number", secure: false, control: numberController, validator: (value){
                          if(value!.isNotEmpty && !value.contains(RegExp(r'[0-9]') )){
                            return "This field takes in only numbers";
                          }
                          else if(value.isEmpty)
                            return"this field is required";
                        },
                        type: TextInputType.number),
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
                                isValidated = true;
                              }
                              if (isValidated) {
                                isValidated = false;
                                final id = await _insert();
                                if (id != null) {
                                  Navigator.pushNamed(context, LoginScreen.id);
                                }
                                firstNameController.clear();
                                lastNameController.clear();
                                userNameController.clear();
                                numberController.clear();
                                passwordController.clear();
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
                ),
              ],
            ),
          ),
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
    final allRows = await dbHelper.queryAllRows(DatabaseHelper.table);
    print('query all rows: $allRows');

  }

}
