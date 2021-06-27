import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'file:///D:/NewApps/centic_bids/lib/view_models/auth-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback onTap;

  CustomButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
