
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meter_app/register/textfields.dart';
import 'package:meter_app/networking.dart';
class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: ListView(
            children: [
              Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:30,left:30),
                      child: Visibility(
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:60,left:30,bottom: 40),
                      child: Text(
                        "User profile",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w700


                        ),

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

                          value: value,
                          title: "name",
                          icon:Icons.person
                          ),
                          ProfileCard(
                              value: value,
                              title: 'email',
                              icon: Icons.email
                          ),
                          ProfileCard(
                              value: value,
                              title: 'phone',
                              icon: Icons.call
                          ),
                          ProfileCard(
                              value: value,
                              title: 'phone',
                              icon: Icons.call
                          ),
                          ProfileCard(
                              value: value,
                              title: 'phone',
                              icon: Icons.call
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
                    ProfileButton(() {
                      setState(() {
                        value = true;
                      });
                    }, "Update", !value, EdgeInsets.symmetric(horizontal: 80.0)),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        ProfileButton((){
//                           setState(() {
//                             value = false;

//                           });
                           Network dataHelper = Network();
                           dataHelper.getUserData();
                        }, "Back", value, EdgeInsets.only(right: 20.0, left: 50.0)),
                        ProfileButton(() async {

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

