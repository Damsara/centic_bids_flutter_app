import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/screens/bids-screen.dart';
import 'package:centic_bids/screens/home-screen.dart';
import 'package:centic_bids/screens/profile-screen.dart';
import 'package:centic_bids/screens/search-screen.dart';
import 'package:centic_bids/view_models/bottom-nav-view-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        // Rebuild only the Text when counterProvider updates
        builder: (context,  watch, child) {
          // Listens to the value exposed by counterProvider
          switch(watch(tabController)){
            case 0:
              return HomeScreen();
              break;
            case 1:
              return SearchScreen();
              break;
            case 2:
              return BiddingScreen();
              break;
            case 3:
              return ProfileScreen();
              break;
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: Consumer(
        builder: (context,  watch, child) {
          return BottomNavigationBar(
            onTap: (index) {
              context.read(tabController.notifier).changeTab(index);
            },
            currentIndex: watch(tabController),
            items: [
              BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: new Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: new Icon(Icons.all_inbox_rounded), label: 'Bidding'),
              BottomNavigationBarItem(icon: new Icon(Icons.supervised_user_circle), label: 'Profile'),
            ],
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
          );
        },
      ),
    );
  }
}
