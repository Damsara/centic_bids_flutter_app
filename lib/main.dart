import 'package:centic_bids/screens/main-screen.dart';
import 'package:centic_bids/service-locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'centic_bid_header.dart';

void main() {
  setupLocator();
  runApp(ProviderScope(child: CenticBidHead()));
}

