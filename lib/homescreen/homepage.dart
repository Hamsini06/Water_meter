import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
             flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Image.asset("images/water-tap.png",
                        scale: 5,
                        alignment: Alignment.centerLeft,),
                      ),
                    ),
                  ),


               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(4),
                   child: Container(

                     decoration: BoxDecoration(
                       color: Color(0xffDEEDF0),
                       borderRadius: BorderRadius.circular(15.0),
                     ),

                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("VALVE TIMINGS",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 15.0,

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
               )
                ],

              ),
            ),

            Expanded(
              flex: 1,
              child: Row(
                children: [

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100,
                          borderRadius: BorderRadius.circular(5.0)
                        ),

                          child: Text("Random text",
                          style: TextStyle(
                           fontSize: 15.0
                          ),)),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              borderRadius: BorderRadius.circular(5.0)
                          ),

                          child: Text("Random Info",
                            style: TextStyle(
                                fontSize: 15.0
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                children: [

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: Container(
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
                      padding: const EdgeInsets.symmetric(horizontal: 9.0),
                      child: Container(
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
              ),),


            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(

                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(

                          decoration: BoxDecoration(
                            color: Color(0xffDEEDF0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("VALVE TIMINGS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.0,

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
                    ),

                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Image.asset("images/water-drops.png",
                            scale: 7.0,
                            alignment: Alignment.center,),
                        ),
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
