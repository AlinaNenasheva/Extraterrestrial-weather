
import 'dart:convert';

import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:extraterrestrial_weather/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  var _dialogService = locator<DialogService>();

  getSettingsOptions(String option) {
    switch (option) {
      case "Language":
        _onLanguageOptionPressed();
        break;
      case "Help":
        return () {};
      case "Theme":
        return () {};
      default:
        return () {};
    }
  }

  void _onLanguageOptionPressed() async {
    var response = await _dialogService.showCustomDialog(
      variant: DialogType.language,
      title: 'Choose language',
      mainButtonTitle: 'Ok',
    );
    if (response!.confirmed) {
      //TODO change language
    }
  }
}
