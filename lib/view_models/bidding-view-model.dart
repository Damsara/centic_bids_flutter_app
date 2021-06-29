

import 'package:centic_bids/models/bid-item.dart';
import 'package:centic_bids/service-locator.dart';
import 'package:centic_bids/services/firebase/data-service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final dataAsyncNotifier = StateNotifierProvider<DataNotifier , AsyncValue<List<BidItem>>>((ref) => DataNotifier());


class DataNotifier extends StateNotifier<AsyncValue<List<BidItem>>>{
  DataNotifier() : super(AsyncData([]));

  void getData() async{
    state = await locator<DataService>().getProducts();
  }

  void pageViewIndex(int position){

  }

}

final pageIndex = StateNotifierProvider<PageIndex , int>((ref) => PageIndex());

class PageIndex extends StateNotifier<int>{
  PageIndex() : super(0);

  void changePage(int tabNumber) {
    state = tabNumber;
  }
}

final bidPrice = StateNotifierProvider<BiddingPrice , double>((ref) => BiddingPrice(0.0));

class BiddingPrice extends StateNotifier<double>{
  BiddingPrice(double state) : super(0.0);

  void addPrice(double price){
    state = price;
  }

}