import 'dart:js';

import 'file:///D:/NewApps/centic_bids/lib/screens/authentication/login-screen.dart';
import 'package:centic_bids/screens/authentication/register-screen.dart';
import 'package:centic_bids/screens/bids-description-screen.dart';
import 'package:centic_bids/screens/main-screen.dart';
import 'package:centic_bids/screens/splash-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app-strings.dart';

Route<dynamic> generateRoute(RouteSettings settings){

  switch (settings.name){

    case MAIN_SCREEN:
      return MaterialPageRoute(builder: (context) => MainScreen());

    case LOGIN_SCREEN:
      return MaterialPageRoute(builder: (context) => LoginScreen());

    case REGISTER_SCREEN:
      return MaterialPageRoute(builder: (context) => RegisterScreen());

    case BID_DESCRIPTION_SCREEN:
      return MaterialPageRoute(builder: (context) => BidsDescriptionScreen());

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}