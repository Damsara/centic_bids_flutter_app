import 'package:centic_bids/helper/app-colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        focusNode: FocusNode(),
        keyboardType: TextInputType.text,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Icon(Icons.email),
          ),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: PRIMARY_COLOR),
            borderRadius: BorderRadius.circular(6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.only(left: 12.0 , top: 20 , bottom: 20),
        ),
      ),
    );
  }
}
