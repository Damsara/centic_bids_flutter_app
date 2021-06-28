import 'package:cached_network_image/cached_network_image.dart';
import 'package:centic_bids/helper/app-colors.dart';
import 'package:centic_bids/helper/app-screen-utils.dart';
import 'package:centic_bids/widgets/custom-alert-dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(primary: PRIMARY_COLOR);

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
          Container(
            height: ScreenUtils.getDesignHeight(300),
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
                              'Title of the Item',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            child: Text(
                              'Description of the item',
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
                                child: Text(
                                  '1:10:05',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
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
                        imageUrl: 'https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/05/987525-The-8-Best-Hoka-Shoes-for-Runners-1296x728-Header-e0edef.jpg?w=1155&h=1528',
                      ),
                    ),
                  ),

                  Container(
                    margin:
                        EdgeInsets.only(top: ScreenUtils.getDesignHeight(20)),
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
                                '\$200',
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
                                '\$280',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: PRIMARY_COLOR),
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          style: buttonStyle,
                            onPressed: (){
                              customAlert(context: context , title: 'Login is Required' , contentBody: 'Please login so you can access the bid description and place your bid');
                            }, child: Text('Make Bid Offer'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }


}
