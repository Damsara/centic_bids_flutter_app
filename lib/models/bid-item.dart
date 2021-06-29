import 'package:cloud_firestore/cloud_firestore.dart';

class BidItem{

  String title;
  String description;
  double base_price;
  double latest_bid;
  List<dynamic> first_image = [];
  Timestamp timer;

  BidItem(parsedJson){
    title = parsedJson['title'];
    description = parsedJson['description'];
    base_price = double.parse(parsedJson['base-price'].toString());
    latest_bid = double.parse(parsedJson['latest-bid'].toString());
    timer = parsedJson['duration'];

    if(parsedJson['images'] != null && parsedJson['images'] != []){
      parsedJson['images'].forEach((productImage){
        first_image.add(productImage);
      });
    }
  }

}