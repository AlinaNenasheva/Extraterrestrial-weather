// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/view/home/home_view.dart';
import '../ui/view/home/mars_weather/mars_weather_view.dart';
import '../ui/view/home/random_picture/random_picture_view.dart';
import '../ui/view/home/settings/liked_images/liked_images_view.dart';
import '../ui/view/home/settings/settings_view.dart';
import '../ui/view/onboardings/welcome_view.dart';

class Routes {
  static const String welcomeView = '/';
  static const String randomPictureView = '/random-picture-view';
  static const String marsWeatherView = '/mars-weather-view';
  static const String settingsView = '/settings-view';
  static const String homeView = '/home-view';
  static const String likedImagesView = '/liked-images-view';
  static const all = <String>{
    welcomeView,
    randomPictureView,
    marsWeatherView,
    settingsView,
    homeView,
    likedImagesView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomeView, page: WelcomeView),
    RouteDef(Routes.randomPictureView, page: RandomPictureView),
    RouteDef(Routes.marsWeatherView, page: MarsWeatherView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.likedImagesView, page: LikedImagesView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    WelcomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeView(),
        settings: data,
      );
    },
    RandomPictureView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RandomPictureView(),
        settings: data,
      );
    },
    MarsWeatherView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => MarsWeatherView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    LikedImagesView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LikedImagesView(),
        settings: data,
      );
    },
  };
}
