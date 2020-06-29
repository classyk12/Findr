

import 'package:findr/services/agent.dart';
import 'package:findr/services/auth.dart';
import 'package:findr/services/house.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<AgentService>(() => AgentService());
  locator.registerLazySingleton<HouseService>(() => HouseService());
}