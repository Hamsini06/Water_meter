import 'package:flutter/material.dart';
import 'package:water_meter_app/register/login.dart';
import 'package:water_meter_app/register/signup.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "homepage";


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(



        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Image.asset("images/water-tap.png",
                        scale: 7.0,
                        alignment: Alignment.centerLeft,),
                      ),
                    ),
                  SizedBox(
                    width: 20.0,
                  ),

                 Container(
                   height: 170.0,
                   width: 210.0,
                   decoration: BoxDecoration(
                     color: Color(0xffDEEDF0),
                     borderRadius: BorderRadius.circular(20.0),
                   ),

                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("VALVE TIMINGS",
                       style: TextStyle(
                         fontSize: 20.0,

                       ),),
                       SizedBox(
                         height: 20.0,
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("ON"),
                           SizedBox(
                             width: 30.0,
                           ),
                           Text("---"),

                         ],
                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text("OFF"),
                           SizedBox(
                             width: 30.0,
                           ),
                           Text("---"),

                         ],
                       ),

                     ],
                   ),
                 )
                  ],

                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                            borderRadius: BorderRadius.circular(5.0)
                          ),

                            child: Text("Random text",
                            style: TextStyle(
                             fontSize: 15.0
                            ),)),
                        SizedBox(
                          width: 90.0,
                        ),
                        Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                borderRadius: BorderRadius.circular(5.0)
                            ),

                            child: Text("Random Info",
                              style: TextStyle(
                                  fontSize: 15.0
                              ),)),
                      ],
                    ),
                  ),
                  Row(
                    children: [

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Color(0xffB5EAEA),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
                            ),
                            child: Center(child: Text("info 1",)),


                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Color(0xffB5EAEA),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
                            ),
                            child: Center(child: Text("info 2",)),


                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Color(0xffB5EAEA),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
                            ),
                            child: Center(child: Text("info 3",)),


                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150.0,
                            decoration: BoxDecoration(
                                color: Color(0xffB5EAEA),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
                            ),
                            child: Center(child: Text("info 4",)),


                          ),
                        ),
                      ),



                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 130.0,
                        width: 210.0,
                        decoration: BoxDecoration(
                          color: Color(0xffDEEDF0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("VALVE TIMINGS",
                              style: TextStyle(
                                fontSize: 20.0,

                              ),),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ON"),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text("---"),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("OFF"),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text("---"),

                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),


                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Image.asset("images/water-drops.png",
                          scale: 7.0,
                          alignment: Alignment.centerLeft,),
                      ),
                    ),
                  ],

                ),
              ),
            ),


          ],
        ),


      ),
    );
  }
}
