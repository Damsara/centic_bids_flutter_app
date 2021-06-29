

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

}