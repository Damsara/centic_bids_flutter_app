import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'file:///D:/NewApps/centic_bids/lib/view_models/splash-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtils.setScreenSizes(context);
    context.read(pageController.notifier).changeScreen();
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: Center(child: Text('This is the Splash Screen'),),
      ),
    );
  }
}
