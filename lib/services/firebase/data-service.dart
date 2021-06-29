

import 'package:centic_bids/models/bid-item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DataService{

  final CollectionReference bidItemList = FirebaseFirestore.instance.collection('products');


  Future<AsyncValue<List<BidItem>>> getProducts() async {

    AsyncValue<List<BidItem>> itemList = AsyncData([]);

    try{
      await bidItemList.get().then((value) {
        value.docs.forEach((element) {
          itemList.data.value.add(BidItem(element.data()));
        });
      });

      return itemList;
    }catch (e){
      print('Error Code ' + e.toString());
      return AsyncData([]);
    }
  }


}