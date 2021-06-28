import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:flutter/material.dart';

import '../service-locator.dart';

Future<void> customAlert(
    {@required BuildContext context, String title, String contentBody}) {
  final _height = ScreenUtils.totalBodyHeight;
  final _width = ScreenUtils.bodyWidth;

  return showGeneralDialog<void>(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                content: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Nunito',
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: _width * 0.5,
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          contentBody,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: _height * 0.06,
                        margin: EdgeInsets.only(
                            top: _height * 0.03,
                            bottom: 20,
                            left: 20,
                            right: 20),
                        width: _width * 0.5,
                        child: ElevatedButton(
                          onPressed: () => locator<NavigationService>().pushReplacement(LOGIN_SCREEN),
                          child: FittedBox(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'NunitoExtraBold',
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return;
      });
}