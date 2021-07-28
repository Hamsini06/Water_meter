import 'package:flutter/material.dart';
class PaymentOptions extends StatelessWidget {
  static const id = "payOption";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Payment Options")
          ),
          body: Column(
            children: [
              Container(

                child: Padding(
                  padding: const EdgeInsets.only(top:8,left: 8,bottom: 8),
                  child: ListTile(
                    leading: Text(
                        "Credit Card",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17
                      ),

                    ),
                    trailing : TextButton(
                      onPressed: (){},
                      child: Text("pay"),
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(
                            color: Colors.blue,
                            width: 1,
                            style: BorderStyle.solid
                        ),
                            borderRadius: BorderRadius.circular(10)
                      ),
                    )



                  ),
                ),
              ),
              ),
                SizedBox(
                     height: 10.0,
                     width: 320.0,
                   child: Divider(
                  color: Colors.black,
                     thickness: 0.3,

                   ),
                ),
              Container(

                child: Padding(
                  padding: const EdgeInsets.only(top:8,left: 8,bottom: 8),
                  child: ListTile(
                    leading: Text(
                      "UPI",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                      ),

                    ),
                    trailing : TextButton(
                        onPressed: (){},
                        child: Text("pay"),
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid
                          ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )



                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 320.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 0.3,

                ),
              ),
              Container(

                child: Padding(
                  padding: const EdgeInsets.only(top:8,left: 8,bottom: 8),
                  child: ListTile(
                    leading: Text(
                      "Debit Card",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17
                      ),

                    ),
                    trailing : TextButton(
                        onPressed: (){},
                        child: Text("pay"),
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid
                          ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )



                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 320.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 0.3,

                ),
              ),
              Container(

                child: Padding(
                  padding: const EdgeInsets.only(top:8,left: 8,bottom: 8),
                  child: ListTile(
                    leading:Image.asset(
                    "images/paytm.png",
                         scale: 1,
                       ),


                    trailing : TextButton(
                        onPressed: (){},
                        child: Text("pay"),
                        style: TextButton.styleFrom(
                          primary: Colors.blue,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(side: BorderSide(
                              color: Colors.blue,
                              width: 1,
                              style: BorderStyle.solid
                          ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        )



                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 320.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 0.3,

                ),
              ),

            ],
          ),
        )
    );
  }
}
