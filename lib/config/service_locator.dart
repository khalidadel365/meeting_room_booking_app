import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../core/api/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
}
