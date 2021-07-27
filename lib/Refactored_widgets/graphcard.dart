import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'widgets_graph.dart';
import 'constants.dart';
enum gender { daily, monthly }
class GraphCard extends StatefulWidget {
  @override
  _GraphCardState createState() => _GraphCardState();
}

class _GraphCardState extends State<GraphCard> {

  dynamic segmentedControlValue = 1;
  dynamic barChart=barChartDaily;





  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color:  const Color(0xFF00008B),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Center(
                  child: CupertinoSlidingSegmentedControl(
                  groupValue: segmentedControlValue,
                  backgroundColor: Colors.blue,
                  children: <int, Widget>{
                    1: Text("Daily"),
                    2: Text("Monthly"),
                  },
                  onValueChanged: (i) {
                    setState(() {
                      segmentedControlValue = i;
                      if(segmentedControlValue==1){
                        text = "12";
                        barChart=barChartDaily;
                      }else{
                        text ="81";
                        barChart=barChartMonthly;
                      }
                    });
                  }),
                ),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                barChart

              ],
            ),
          ),
        ),
      ),
    );
  }
}
