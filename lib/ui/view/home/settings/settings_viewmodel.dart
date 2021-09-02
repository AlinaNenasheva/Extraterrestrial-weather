
import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  var _dialogService = locator<DialogService>();

  VoidCallback getSettingsOptions(String option) {
    switch (option) {
      case "Language":
        return _onLanguageOptionPressed();
      case "Help":
        return () {};
      case "Theme":
        return () {};
      default:
        return () {};
    }
  }

  _onLanguageOptionPressed() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.language,
      title: 'Choose language',
      mainButtonTitle: 'Ok',
    );
  }
}
