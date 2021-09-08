// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:sqflite/sqflite.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/api_service.dart';
import '../services/database_service/database_config.dart';
import '../services/database_service/database_service.dart';
import '../services/shared_service.dart';
import '../ui/view/home/mars_weather/mars_weather_viewmodel.dart';
import '../ui/view/home/random_picture/random_picture_viewmodel.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  Database db = await (LocalDatabase().database);
  locator.registerLazySingleton(() => DataBaseService(db));
  locator.registerSingleton(MarsWeatherViewModel());
  locator.registerSingleton(RandomPictureViewModel());
  final sharedService = await SharedService.getInstance();
  locator.registerSingleton(sharedService!);
}
