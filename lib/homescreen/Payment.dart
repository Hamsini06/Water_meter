import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meter_app/homescreen/payment_options.dart';

class PayPage extends StatefulWidget {

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payment"),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Amount to pay",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                "₹ 2375.0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),



                        ],
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.4 ,1],


                            colors: [Colors.lightBlueAccent, Colors.blue],
                          )
                      ),
                    )

                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(

                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context)=>PaymentOptions()
                    )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Recharge",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,

                        )
                    ),

                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,


                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Payment History",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:15,left:8,right:8,bottom:5),
                child: Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),

                      ),
                    gradient: LinearGradient(
                    stops: [0.5 ,1],


                    colors: [Colors.lightBlueAccent, Colors.blue],
                  )

                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:60,right:25),
                        child: ListTile(
                          leading: Text(
                            "Date",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                          trailing: Text(
                            "Amount paid",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),

                          ),
                        ),
                      ),

                      Expanded(
                        child: ListView(
                          children: [


                            PayDate(),
                            PayDate(),
                            PayDate(),



                          ],
                        ),
                      ),
                    ],
                  )
                ),
              )
            )
          ],
        )
      ),
    );
  }
}

class PayDate extends StatelessWidget {
  const PayDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:35,right:35),
      child: ListTile(
        leading: Text(
          "23rd july 2021",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),

        ),
        trailing: Text(
          "₹ 2375.0",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),

        ),
      ),
    );
  }
}
