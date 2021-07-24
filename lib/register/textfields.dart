import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  final String text;
  final bool secure;
  final TextEditingController control;
  final String? Function(String?)? validator;
  final TextInputType? type;


  FieldText(this.text,{required this.secure,required this.control,this.validator, this.type });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, 10.0, 7.0, 10.0),
      child: TextFormField(
        keyboardType: type,
        validator: validator,
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
class ProfileText extends StatelessWidget {

  bool value;
  String text;
  void Function(String)? onChanged;

  ProfileText(this.value, {this.text = "something", this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
      child: TextFormField(
        onChanged: onChanged,
        initialValue: text,
        enabled: value,
        decoration: InputDecoration(
            border: UnderlineInputBorder(

            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0)
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {

  final void Function()? onpressed;
  final String text;
  final bool val;
  final EdgeInsetsGeometry padding;
  ProfileButton(this.onpressed, this.text, this.val, this.padding);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: val,
      child: Padding(
        padding: padding,
        child: Material(
          color:Colors.blueAccent.shade200,
          borderRadius: BorderRadius.circular(15.0),
          child: MaterialButton(
            onPressed: onpressed,
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
      ),
    );
  }
}
class ProfileCard extends StatelessWidget {
  ProfileCard({required this.value,required this.title,required this.icon,required this.cardText, this.onChanged});

  final bool value;
  final String title;
  final IconData icon;
  final String cardText;
  void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(8.0),
      child: ListTile(
        subtitle: ProfileText(value,text: cardText,onChanged: onChanged,),


        title:Text(
            title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 15
            )
        ),
        leading: Icon(
          icon,
          size: 30,
        ),
      ),
    );
  }
}


