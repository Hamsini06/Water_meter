
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:meter_app/register/textfields.dart';
import 'package:meter_app/networking.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool value = false;
  bool updated = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 30, bottom: 30),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: value,
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            value = !value;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "User profile",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700


                      ),

                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        children: [
                          ProfileCard(
                              cardText: Provider.of<Data>(context).data["firstName"],
                              value: false,
                              title: "First Name",
                              icon:Icons.person
                          ),
                          ProfileCard(
                            cardText: Provider.of<Data>(context).data["lastName"],
                              value: false,
                              title: 'Last Name',
                              icon: Icons.person
                          ),
                          ProfileCard(
                            cardText: Provider.of<Data>(context).data["mobileNo"],
                              value: value,
                              onChanged: (value) async {

                                // if(message["message"] != "" && message["statusCode"] == 200){
                                //   updated = true;
                                // }
                                // else if (message["statusCode"] == 401){
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(SnackBar(content: Text('Unauthorized access')));
                                // }
                                // else{
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(SnackBar(content: Text('Error in updating data')));
                                // }
                              },
                              title: 'phone',
                              icon: Icons.call
                          ),
                          ProfileCard(
                            cardText: Provider.of<Data>(context).data["username"],
                              value: false,
                              title: 'Username',
                              icon: Icons.supervised_user_circle_rounded
                          ),
                          ProfileCard(
                            cardText: "",
                              value: false,
                              title: 'meters',
                              icon: Icons.water_outlined
                          ),







                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ProfileButton(() async {
                      setState(() {
                        value = true;
                      });

                    }, "Update", !value, EdgeInsets.symmetric(horizontal: 80.0)),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        ProfileButton(() async {
                          setState(() {
                            value = false;

                          });
                          Map data = await Network().getUserData();
                          print(data);

                        }, "Back", value, EdgeInsets.only(right: 20.0, left: 50.0)),
                        ProfileButton(() async {
                          Map<dynamic,dynamic> message = await Network().postUpdatedData("9885019770");
                          if(message["statusCode"] == 200){
                            Map data = await Network().getUserData();
                            print(data);
                          }
                        }, "Save", value, EdgeInsets.only(left: 50.0)),
                      ],
                    )
                  ],
                ),
              )



            ],
          ),
        )
    );
  }
}

