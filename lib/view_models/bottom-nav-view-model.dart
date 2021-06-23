

import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BottomNavModel extends StateNotifier<int>{
  BottomNavModel(int state) : super(0);

  int get currentPage ;
  void changeTab(int tabNumber);
}