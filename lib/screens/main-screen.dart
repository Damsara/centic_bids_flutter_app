import 'package:centic_bids/helper/app-colors.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        child: Center(child: Text('This is the main Screen')),
      ),
    );
  }
}
