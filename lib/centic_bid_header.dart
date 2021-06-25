import 'package:centic_bids/service-locator.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:flutter/material.dart';

import 'package:centic_bids/helper/app-routes.dart' as routes;
import 'package:flutter/services.dart';

import 'helper/app-colors.dart';
import 'helper/app-strings.dart';

class CenticBidHead extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: APP_NAME,
      navigatorKey: locator<NavigationService>().navigatorKey,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: BACKGROUND_COLOR,
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
