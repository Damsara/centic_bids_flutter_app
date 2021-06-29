import 'package:cached_network_image/cached_network_image.dart';
import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:centic_bids/helper/app-strings.dart';
import 'package:centic_bids/models/bid-item.dart';
import 'package:centic_bids/service-locator.dart';
import 'package:centic_bids/services/firebase/data-service.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:centic_bids/view_models/auth-view-model.dart';
import 'package:centic_bids/view_models/bidding-view-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:centic_bids/widgets/custom-alert-dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read(dataAsyncNotifier.notifier).getData();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: ScreenUtils.getDesignHeight(80),
            width: ScreenUtils.bodyWidth,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: [
                  Text('Logo should go here'),
                  Spacer(),
                  Icon(
                    Icons.notifications,
                    color: Colors.black,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Consumer(builder: (_, model, __){
            return model(dataAsyncNotifier).when(
                data: (List<BidItem> val){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: val.length,
                      itemBuilder: (BuildContext context , index){
                        return _bidItem(val[index]);
                    },),
                  );
                },
                loading: (){
                  return Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),
                  );
                },
                error: (Object object , StackTrace stacktrace){
                  return Text('An error has occured');
                });
          }),
        ],
      )),
    );
  }

  Widget _bidItem(BidItem item){

    return Container(
      width: ScreenUtils.bodyWidth,
      margin: EdgeInsets.only(
          top: ScreenUtils.getDesignHeight(25),
          bottom: ScreenUtils.getDesignHeight(15)),
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
                        item.title,
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
                        item.description,
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
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: CountdownTimer(endTime: item.timer.millisecondsSinceEpoch,textStyle: TextStyle(fontSize: 14 , fontWeight: FontWeight.bold , color: Colors.white),)
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin:
              EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
              width: ScreenUtils.bodyWidth,
              height: ScreenUtils.getDesignHeight(150),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: item.first_image[0],
                  placeholder: (context , url) => Center(
                    child: Container(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),
                  ),
                ),
              ),
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
                          '\$${item.base_price}',
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
                          '\$${item.latest_bid}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: PRIMARY_COLOR),
                        ),
                      )
                    ],
                  ),
                  Consumer(
                    builder: (_ , model , __){
                      return model(authStateProvider).when(
                          data: (User user){
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
                                onPressed: (){
                                  user == null ? customAlert(context: context , title: 'Login is Required' , contentBody: 'Please login so you can access the bid description and place your bid') : locator<NavigationService>().pushNamed(BID_DESCRIPTION_SCREEN , args: item);
                                }, child: Text('Make Bid Offer'));
                          },
                          loading: () {
                            return CircularProgressIndicator();
                          },
                          error: (Object object , StackTrace stack){
                            return Text('Error has ooccured');
                          });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
