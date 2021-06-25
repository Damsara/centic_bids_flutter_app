import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: ScreenUtils.bodyWidth,
      height: ScreenUtils.getDesignHeight(50),
      decoration: BoxDecoration(
        color: PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(5.0)
      ),
      child: Center(
        child: Text('Login Now' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.white),),
      )
    );
  }
}
