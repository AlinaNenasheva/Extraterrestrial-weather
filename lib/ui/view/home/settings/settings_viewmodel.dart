import 'dart:convert';

import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {
  var _dialogService = locator<DialogService>();
  var _sharedService = locator<SharedService>();

  getSettingsOptions(String option) {
    switch (option) {
      case "language":
        _onLanguageOptionPressed();
        break;
      case "help":
        return () {};
      case "theme":
        return () {};
      default:
        return () {};
    }
  }

  void _onLanguageOptionPressed() async {
    var response = await _dialogService.showCustomDialog(
      data: await _sharedService.getCurrentLanguage(),
      variant: DialogType.language,
      title: loc.tr(ConstKeys.choose_language),
      mainButtonTitle: 'Ok',
    );
    if (response!.confirmed) {
      _sharedService.currentLanguage = response.data;
    }
  }
}
