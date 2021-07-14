import 'package:flutter/material.dart';
import 'package:water_meter_app/ex.dart';
import 'package:water_meter_app/homescreen/homepage.dart';
import 'package:water_meter_app/register/signup.dart';
import 'package:water_meter_app/register/textfields.dart';
import 'package:water_meter_app/Database_helper.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final dbHelper = DatabaseHelper.instance;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0,vertical: 20.0),
                child: Text("Login",
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                  ),),
              ),
              SizedBox(
                height: 30.0,
              ),
              FieldText("Username/Email", secure: false,control: userNameController),
              FieldText("Password",secure: true,control: passwordController),
              ButtonText(
                colour: Colors.lightBlueAccent,
                text: "Login",
                onPressed: () async{


                  final id = await loginUser();
                  if(id != null){
                    Navigator.pushNamed(context, Example.id);
                  }


                },

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
          )
      ),
    );
  }

  Future loginUser() async {
    List<Map<String, dynamic>> data = await dbHelper.checkLogin(userNameController.text, passwordController.text);
    if(data.length > 0){
      Map<String, dynamic> login_rows = {
        DatabaseHelper.userName: userNameController.text,
        DatabaseHelper.password: passwordController.text
      };
      final id = await dbHelper.insert_data(DatabaseHelper.table_login,login_rows);
      print("id inserted in login table is $id");
      return id;
    }

  }


}
