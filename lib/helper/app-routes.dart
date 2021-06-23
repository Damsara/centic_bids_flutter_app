import 'package:centic_bids/screens/main-screen.dart';
import 'package:centic_bids/screens/splash-screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app-strings.dart';

Route<dynamic> generateRoute(RouteSettings settings){

  switch (settings.name){

    case MAIN_SCREEN:
      return MaterialPageRoute(builder: (context) => MainScreen());

    default:
      return MaterialPageRoute(builder: (context) => SplashScreen());
  }
}