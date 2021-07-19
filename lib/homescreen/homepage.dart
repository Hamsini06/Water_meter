import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//added this line as i changed the folder
import 'package:water_meter_app/Refactored_widgets/widgets_homescreen.dart';

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



        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
               flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      ImageCard(
                        padding: const EdgeInsets.only(left: 5.0),
                        image: "images/water-tap.png",
                        alignment: Alignment.centerLeft,

                      ),


                   ValveCard()
                    ],

                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    RandomCard(),

                    RandomCard(),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                  children: [

                    InfoCard(info: "info 1",),
                    InfoCard(info: "info 2",),
                    InfoCard(info: "info 3",),
                    InfoCard(info: "info 4",),



                  ],
              ),
                ),),


              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left:15.0,bottom:5.0),
                  child: Row(

                    children: [
                      ValveCard(),
                      ImageCard(
                          padding: const EdgeInsets.only(right: 5.0),
                          image: "images/water-drops.png",
                          alignment: Alignment.centerRight,
                          scale: 8.0,

                      )


                    ],

                  ),
                ),
              ),


            ],
          ),
        ),


      ),
    );
  }
}








