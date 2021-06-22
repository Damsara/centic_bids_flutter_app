import 'package:centic_bids/service-locator.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:flutter/material.dart';

import 'package:centic_bids/helper/app-routes.dart' as routes;

import 'helper/app-colors.dart';
import 'helper/app-strings.dart';

class CenticBidHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: BACKGROUND_COLOR,
        primarySwatch: Colors.blue,
      ),
      initialRoute: SPLASH_SCREEN,
      onGenerateRoute: routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
