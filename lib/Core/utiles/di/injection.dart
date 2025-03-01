import 'package:asroo_app/core/utiles/service/dio/dio_factory.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setup_Service() {
  final Dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  getIt..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
  // getIt.registerLazySingleton<Apiservice>(() => Apiservice(dio: Dio));
}
