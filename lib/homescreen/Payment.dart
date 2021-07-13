import 'package:flutter/material.dart';

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
      ),
    );
  }
}
