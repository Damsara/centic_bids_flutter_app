import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-enums.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:centic_bids/view_models/auth-view-model.dart';
import 'package:centic_bids/widgets/custom-button-widget.dart';
import 'package:centic_bids/widgets/custom-textfield-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service-locator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email, password, confirm_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: ScreenUtils.getDesignHeight(30), left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () =>
                      locator<NavigationService>().pushReplacement(MAIN_SCREEN),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Back to Home',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: PRIMARY_COLOR),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 150,
                    margin:
                        EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                    width: 150,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      'LOGO HERE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(40)),
                  child: Text(
                    'Welcome to Centic Bids!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(5)),
                  child: Text(
                    'Please enter your email and password to create an account',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                  child: Text(
                    'Email Address',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Consumer(
                  builder: (context, watch, child) {
                    return watch(loginAsyncNotifier).when(
                        data: (Validations val) {
                          return CustomTextField(
                            iconData: Icons.email,
                            hideText: false,
                            onChanged: (val) => email = val,
                            errorText: val == Validations.EMPTY
                                ? 'Please enter email address'
                                : val == Validations.FAILED
                                    ? 'Something went wrong'
                                    : val == Validations.FORMAT ? 'Enter a valid email' : null,
                          );
                        },
                        loading: () => CircularProgressIndicator(),
                        error: (Object object, StackTrace stackTrace) {
                          return Text('Error Occured');
                        });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Consumer(
                  builder: (context, watch, child) {
                    return watch(loginAsyncNotifier).when(
                        data: (Validations val) {
                          return CustomTextField(
                            iconData: Icons.lock,
                            hideText: true,
                            onChanged: (val) => password = val,
                            errorText: val == Validations.EMPTY
                                ? 'Please enter password'
                                : val == Validations.SAME
                                    ? 'Doesn\'t match the confirm password'
                                    : null,
                          );
                        },
                        loading: () => CircularProgressIndicator(),
                        error: (Object object, StackTrace stackTrace) {
                          return Text('Error Occured');
                        });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Consumer(
                  builder: (context, watch, child) {
                    return watch(loginAsyncNotifier).when(
                        data: (Validations val) {
                          return CustomTextField(
                            iconData: Icons.lock,
                            hideText: true,
                            onChanged: (val) => confirm_password = val,
                            errorText: val == Validations.EMPTY
                                ? 'Please enter confirm password'
                                : val == Validations.SAME
                                    ? 'Doesn\'t match the password'
                                    : null,
                          );
                        },
                        loading: () => CircularProgressIndicator(),
                        error: (Object object, StackTrace stackTrace) {
                          return Text('Error Occured');
                        });
                  },
                ),
                CustomButton(
                  buttonText: 'Reigster Now',
                  color: PRIMARY_COLOR,
                  onTap: () => context
                      .read(loginAsyncNotifier.notifier)
                      .register(
                          this.email, this.password, this.confirm_password),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
