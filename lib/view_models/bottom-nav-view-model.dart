

import 'package:flutter_riverpod/flutter_riverpod.dart';


final tabController = StateNotifierProvider<BottomNavViewModel , int>((ref) => BottomNavViewModel());


class BottomNavViewModel extends StateNotifier<int>{
  BottomNavViewModel() : super(0);

  void changeTab(int tabNumber) {
    state = tabNumber;
  }

}