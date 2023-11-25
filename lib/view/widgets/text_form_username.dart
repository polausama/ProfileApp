import 'package:flutter/material.dart';

class Custom_Text_Field extends StatelessWidget {
String? hintName;
String?labelName;
 String? username;
  IconData? icon;
 final void Function(String? value)? saved;
   Custom_Text_Field({this.hintName,this.icon,this.labelName,this.saved});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: false,
        onSaved: saved,
        validator: (value) {
                  if (value!.isEmpty|| value == null) {
                    return "please enter your user name";
                  } else if (!value.contains('@') || !value.contains('.com')) {
                    return ' invalid eimail format';
                  }
                  return null;
                },
        decoration: InputDecoration(
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red),
          ), 
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.red),
          ), 
          prefixIcon: Icon(icon),
          hintText: hintName,
          labelText: labelName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }
}

  
