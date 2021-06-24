

import 'package:flutter_riverpod/flutter_riverpod.dart';


final tabController = StateNotifierProvider<BottomNavModel , int>((ref) => BottomNavModel());


class BottomNavModel extends StateNotifier<int>{
  BottomNavModel() : super(0);

  void changeTab(int tabNumber) {
    state = tabNumber;
  }

}