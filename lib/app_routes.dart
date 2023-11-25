import 'package:flutter/material.dart';
import 'package:flutter_profile_app/constants.dart';
import 'package:flutter_profile_app/view/screens/loginScreen.dart';
import 'package:flutter_profile_app/view/screens/showdata.dart';
import 'package:flutter_profile_app/view/screens/signupScreen.dart';

class AppRouter {
  static  Route? generateRoute(RouteSettings settings){
    switch (settings.name
    ) {
      case loginpath : return MaterialPageRoute(
        builder: (context)=>LoginScreen());
        case signuppath: return MaterialPageRoute(
        builder: (context)=>SignupScreen());
        case showdatapath: return MaterialPageRoute(
        builder: (context)=>ShowData());
        
    }
  }
}
