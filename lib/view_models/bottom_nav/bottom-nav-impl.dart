

import 'package:centic_bids/view_models/bottom_nav/bottom-nav-model.dart';

class ImplBotNavigation extends BottomNavModel{
  ImplBotNavigation(int state) : super(0);

  var _currentPage = 0;

  @override
  void changeTab(int tabNumber) {
    _currentPage = tabNumber;
  }

  @override
  int get currentPage => _currentPage;
}