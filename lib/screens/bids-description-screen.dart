import 'package:cached_network_image/cached_network_image.dart';
import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:centic_bids/models/bid-item.dart';
import 'package:centic_bids/view_models/auth-view-model.dart';
import 'package:centic_bids/view_models/bidding-view-model.dart';
import 'package:centic_bids/view_models/bottom-nav-view-model.dart';
import 'package:centic_bids/widgets/custom-button-widget.dart';
import 'package:centic_bids/widgets/custom-textfield-widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BidsDescriptionScreen extends StatefulWidget {

  final BidItem bidItemDetails;

  BidsDescriptionScreen({this.bidItemDetails});

  @override
  _BidsDescriptionScreenState createState() => _BidsDescriptionScreenState();
}

class _BidsDescriptionScreenState extends State<BidsDescriptionScreen> {

  double val;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: ScreenUtils.bodyWidth,
                height: ScreenUtils.getDesignHeight(230),
                child: Stack(
                  children: [
                    PageView.builder(
                        itemCount: widget.bidItemDetails.first_image.length,
                        itemBuilder: (BuildContext context , index){
                      return CachedNetworkImage(
                          fit: BoxFit.fill,
                          placeholder: (context , url) => Center(
                            child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator()),
                          ),
                          imageUrl: widget.bidItemDetails.first_image[index]);
                    },
                      onPageChanged: (int position) {
                        context.read(pageIndex.notifier).changePage(position);
                      },
                    ),
                    Positioned(
                      bottom: 5,
                      child: Consumer(
                        builder: (_ , T Function<T>(ProviderBase<Object, T>) model , __){
                          return Container(
                            width: ScreenUtils.bodyWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DotsIndicator(
                                  dotsCount: widget.bidItemDetails.first_image.length,
                                  position: model(pageIndex).toDouble(),
                                  decorator: DotsDecorator(
                                    size: const Size.square(9.0),
                                    activeSize: const Size(18.0, 9.0),
                                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24 , right: 24 , top: ScreenUtils.getDesignHeight(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                widget.bidItemDetails.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              width: ScreenUtils.getDesignWidth(200),
                              child: Text(
                                widget.bidItemDetails.description,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: ScreenUtils.getDesignWidth(35),
                          width: ScreenUtils.getDesignWidth(95),
                          decoration: BoxDecoration(
                              color: PRIMARY_COLOR.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(3.0),
                              border: Border.all(color: PRIMARY_COLOR, width: 2)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.hourglass_bottom,
                                  color: Colors.white,
                                ), CountdownTimer(endTime: widget.bidItemDetails.timer.millisecondsSinceEpoch,textStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: Colors.white)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Base Price',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text(
                                  '\$${widget.bidItemDetails.base_price}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: PRIMARY_COLOR),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Current Bid',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Text(
                                  '\$${widget.bidItemDetails.latest_bid}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: PRIMARY_COLOR),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'My Bid Price',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Consumer(
                                  builder: (_ , model , __){
                                    return Text(
                                      model(bidPrice) == 0.0 ? 'No Bids' : '\$${model(bidPrice)}',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    );
                                  }
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
                      child: Text('Enter your Bid Amount' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: ScreenUtils.getDesignHeight(10)),
                        child: CustomTextField(iconData: Icons.monetization_on ,hideText: false,type: TextInputType.number, onChanged: (value) => val = double.parse(value),)),
                    CustomButton(color: PRIMARY_COLOR, buttonText: 'Place Bid Now', onTap: () => context.read(bidPrice.notifier).addPrice(this.val),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
