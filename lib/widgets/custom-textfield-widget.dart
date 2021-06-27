import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-enums.dart';
import 'file:///D:/NewApps/centic_bids/lib/view_models/auth-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends StatelessWidget {


  final IconData iconData;
  final bool hideText;
  final TextFields textfield;
  final Function(String) onChanged;
  final String errorText;

  CustomTextField({this.iconData , this.hideText , this.textfield , this.onChanged , this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),

        focusNode: FocusNode(),
        obscureText: hideText,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          prefixIcon: Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Icon(iconData),
          ),
          errorText: errorText,
          fillColor: Colors.white,
          filled: true,
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
