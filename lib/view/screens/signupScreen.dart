import 'package:flutter/material.dart';
import 'package:flutter_profile_app/constants.dart';
import 'package:flutter_profile_app/model/my_database.dart';
import 'package:flutter_profile_app/model/user.dart';
import 'package:flutter_profile_app/view/widgets/text_form_signup.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite/sqflite.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  late MyDataBase db;
  User user = User();
  var snackBar = SnackBar(
    backgroundColor: Colors.red,
    content: Text(' password mismatch'),
  );
  var snackBar2 = SnackBar(
    backgroundColor: Colors.green,
    content: Text('  sign up sucssfuel'),
  );
  @override
  void initState() {
    super.initState();
    db = MyDataBase();
    db.initializeDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with Signup'),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      width: 200,
                      height: 200,
                      child: Lottie.network(
                        'https://lottie.host/2d70ba80-5085-4b3d-862b-95221c8a5317/onmdeuJ2RO.json',
                        fit: BoxFit.fill,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Custom_TextField_Signup(
                      saved: (value) {
                        user.uid = value;
                      },
                      icon: Icons.person,
                      hintName: 'User ID'),
                  SizedBox(height: 10.0),
                  Custom_TextField_Signup(
                      saved: (value) {
                        user.uname = value;
                      },
                      icon: Icons.person_outline,
                      inputType: TextInputType.name,
                      hintName: 'User Name'),
                  SizedBox(height: 10.0),
                  Custom_TextField_Signup(
                      saved: (value) {
                        user.email = value;
                      },
                      icon: Icons.email,
                      inputType: TextInputType.emailAddress,
                      hintName: 'Email'),
                  SizedBox(height: 10.0),
                  Custom_TextField_Signup(
                    saved: (value) {
                      user.password = value;
                    },
                    icon: Icons.lock,
                    hintName: 'Password',
                  ),
                  SizedBox(height: 10.0),
                  Custom_TextField_Signup(
                    saved: (value) {
                      user.cpassword = value;
                    },
                    icon: Icons.lock,
                    hintName: 'Confirm Password',
                  ),
                  Container(
                    margin: EdgeInsets.all(30.0),
                    width: double.infinity,
                    child: TextButton(
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          if (user.password == user.cpassword) {
                            await db.insertUserinDB(user);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar2);
                            Navigator.pushNamed(context, showdatapath);
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          //de else
                        } // de if
                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Does you have account? '),
                        TextButton(
                          //textColor: Colors.blue,
                          child: Text('Sign In'),
                          onPressed: () {
                            Navigator.pushNamed(context, loginpath);
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
