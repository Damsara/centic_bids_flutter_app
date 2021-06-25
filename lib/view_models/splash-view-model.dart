

import 'dart:async';

import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/service-locator.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageController = StateNotifierProvider<SplashViewModel , bool>((ref) => SplashViewModel(false));

class SplashViewModel extends StateNotifier<bool>{
  SplashViewModel(bool state) : super(state);

  void changeScreen() {
    Timer(
      Duration(seconds: 3), () => locator<NavigationService>().pushReplacement(LOGIN_SCREEN)
    );
  }
}