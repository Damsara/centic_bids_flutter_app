import 'package:centic_bids/services/firebase/data-service.dart';
import 'package:centic_bids/services/nav-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
FirebaseAuth _firebaseAuth;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DataService>(() => DataService());
}