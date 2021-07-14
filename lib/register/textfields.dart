import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  final String text;
  final bool secure;
  final TextEditingController control;
  FieldText(this.text,{required this.secure,required this.control});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, 10.0, 7.0, 10.0),
      child: TextField(
        controller: control,
        obscureText: secure,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
            hintText: text,
            hintStyle: TextStyle(
                color: Colors.black
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            fillColor: Colors.grey.shade200,
            filled: true
        ),
      ),
    );
  }
}

class ButtonText extends StatelessWidget {

  final String  text;
  final Color? colour;
  final void Function() onPressed;
  ButtonText({this.colour,required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
      child: Material(
        color:colour,
        borderRadius: BorderRadius.circular(25.0),
        child: MaterialButton(onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),),
          ),),
      ),
    );
  }
}
