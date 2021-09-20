import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:extraterrestrial_weather/services/api_service/models/apod_dto.dart';
import 'package:extraterrestrial_weather/services/database_service/models/image_db_item.dart';
import 'package:extraterrestrial_weather/services/api_service/api_service.dart';
import 'package:extraterrestrial_weather/services/database_service/database_service.dart';
import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:translator/translator.dart';

class RandomPictureViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();
  DataBaseService _databaseService = locator<DataBaseService>();
  SharedService _sharedService = SharedService();

  final _translator = GoogleTranslator();
  ApodDto? apodDto;
  bool isLoading = true;
  bool isLiked = false;

  Future<void> _viewPreload() async {
    apodDto = await _apiService.getPictureOfDay();
    isLoading = false;
    if (await _sharedService.getCurrentLanguage() != 'en') {
      apodDto!.copyWith(explanation: (await _translator.translate(apodDto!.explanation!,
          to: await _sharedService.getCurrentLanguage())).text, title: (await _translator.translate(apodDto!.title!,
          to: await _sharedService.getCurrentLanguage())).text);
    }
    notifyListeners();
  }

  RandomPictureViewModel() {
    _viewPreload();
  }

  likeImage() {
    isLiked = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 1), () {
      isLiked = false;
      _databaseService
          .addImage(ImageDbItem(url: apodDto!.url!, date: apodDto!.date!));
      notifyListeners();
    });
  }
}
