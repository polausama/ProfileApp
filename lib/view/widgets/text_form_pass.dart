import 'package:flutter/material.dart';

class Custom_TextField_password extends StatelessWidget {
  String? hintName;
  String? labelName;
  IconData? icon;
   final void Function(String? value)? saved;

  Custom_TextField_password({this.hintName, this.icon, this.labelName,this.saved});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        obscureText: true,
        onSaved: saved,
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return "please enter your password";
          } else if (value.length < 6) {
            return ' invalid password format';
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
          errorBorder: OutlineInputBorder(
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
