import 'package:flutter/material.dart';
class InfoCard extends StatelessWidget {
  const InfoCard({ required this.info}) ;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffB5EAEA),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
          ),
          child: Center(child: Text(info,)),


        ),
      ),
    );
  }
}
class ValveCard extends StatelessWidget {
  const ValveCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
    );
  }
}
class ImageCard extends StatelessWidget {
  const ImageCard({required this.padding, required this.image,this.scale=10,this.alignment=Alignment.center}) ;
  final EdgeInsetsGeometry padding;
  final String image;
  final double? scale;
  final AlignmentGeometry alignment;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: padding,
          child: Image.asset(image,
            scale: scale,
            alignment: alignment,),
        ),
      ),
    );
  }
}
class RandomCard extends StatelessWidget {
  const RandomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: BorderRadius.circular(5.0)
            ),

            child: Text("Random text",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0
              ),)),
      ),
    );
  }
}