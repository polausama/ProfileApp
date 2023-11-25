import 'package:flutter/material.dart';

class Custom_TextField_Signup extends StatelessWidget {
String? hintName;
String?labelName;
  IconData? icon;
  TextInputType? inputType;
   final void Function(String? value)? saved;
  Custom_TextField_Signup({this.hintName,this.icon,this.labelName,this.inputType = TextInputType.text,this.saved});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        onSaved: saved,
        keyboardType: inputType,
        obscureText: false,
        validator: (value) {
                  if (value!.isEmpty|| value == null) {
                    return "please enter your $hintName";
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

  
