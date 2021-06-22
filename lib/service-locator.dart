

import 'package:centic_bids/services/nav-service.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => NetworkService());
  // locator.registerLazySingleton(() => ErrorService());
  // locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => EventBus());
}