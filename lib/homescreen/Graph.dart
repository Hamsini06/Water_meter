import 'package:flutter/material.dart';
import 'package:water_meter_app/Refactored_widgets/graphcard.dart';
class GraphPage extends StatefulWidget {

  @override
  _GraphPageState createState() => _GraphPageState();
}
class _GraphPageState extends State<GraphPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:  Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            Expanded(child: GraphCard()),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("hello",
                    textAlign: TextAlign.center,),
                  ),

                ),
              ),
            )


          ]
        ),
      ),
    );
  }
}
