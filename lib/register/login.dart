import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_meter_app/ex.dart';
import 'package:water_meter_app/register/signup.dart';
import 'package:water_meter_app/register/textfields.dart';
import 'package:water_meter_app/Database_helper.dart';

class LoginScreen extends StatefulWidget {

  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidated = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool logIn = true;
  final dbHelper = DatabaseHelper.instance;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final myController = TextEditingController();
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
                        isValidated = true;
                      }
                      if (isValidated == true) {
                        isValidated = false;
                        bool value = await dbHelper.checkExistingLogin(
                            userNameController.text, passwordController.text);
                        if (value == true) {
                          Navigator.pushNamed(context, Example.id);
                        }
                        else {
                          final id = await loginUser();
                          if (id != null) {
                            Navigator.pushNamed(context, Example.id);
                          }
                          else {
                            logIn = false;
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                title: TextButton(
                                    child: Text("Try Again"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }
                                ),
                              );
                            }
                            );
                          }
                        }
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
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }

  Future loginUser() async {
    List<Map<String, dynamic>> data = await dbHelper.checkLogin(userNameController.text, passwordController.text);
    if(data.length > 0){
      Map<String, dynamic> loginRows = {
        DatabaseHelper.userName: userNameController.text,
        DatabaseHelper.password: passwordController.text
      };
      final id = await dbHelper.insert_data(DatabaseHelper.table_login,loginRows);
      print("id inserted in login table is $id");
      return id;
    }

  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows(DatabaseHelper.table_login);
    print(allRows);
  }


}
