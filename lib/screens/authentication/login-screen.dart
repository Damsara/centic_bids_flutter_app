import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-enums.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'file:///D:/NewApps/centic_bids/lib/view_models/auth-view-model.dart';
import 'package:centic_bids/widgets/custom-button-widget.dart';
import 'package:centic_bids/widgets/custom-textfield-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service-locator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email, password;

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
                    'Welcome Back!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(5)),
                  child: Text(
                    'Please login to place your bids and gain access to other features',
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
                Consumer(builder: (context, watch, child) {
                  return watch(loginAsyncNotifier).when(
                      data: (Validations val) {
                    return CustomTextField(
                        iconData: Icons.email,
                        hideText: false,
                        onChanged: (value) => this.email = value,
                        errorText: val == Validations.FAILED
                            ? 'Incorrect Email Entered'
                            : val == Validations.EMPTY
                                ? 'Enter Email Textfield'
                                : null);
                  }, loading: () {
                    return CircularProgressIndicator();
                  }, error: (Object object, StackTrace stackTrace) {
                    return Text('Error');
                  });
                }),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(25)),
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                Consumer(builder: (context, watch, child) {
                  return watch(loginAsyncNotifier).when(
                      data: (Validations val) {
                        return CustomTextField(
                            iconData: Icons.lock,
                            hideText: true,
                            onChanged: (value) => this.password = value,
                            errorText: val == Validations.FAILED
                                ? 'Incorrect Password Entered'
                                : val == Validations.EMPTY
                                ? 'Please enter your password'
                                : null);
                      }, loading: () {
                    return CircularProgressIndicator();
                  }, error: (Object object, StackTrace stackTrace) {
                    return Text('Error');
                  });
                }),
                CustomButton(
                  buttonText: 'Login Now',
                    color: PRIMARY_COLOR,
                    onTap: () => context
                        .read(loginAsyncNotifier.notifier)
                        .login(this.email, this.password)),
                Container(
                  margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(30)),
                  child: GestureDetector(
                    onTap: () => locator<NavigationService>()
                        .pushReplacement(REGISTER_SCREEN),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                          TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                                fontSize: 16,
                                color: PRIMARY_COLOR,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
