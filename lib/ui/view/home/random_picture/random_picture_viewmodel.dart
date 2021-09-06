import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/models/apod_dto.dart';
import 'package:extraterrestrial_weather/services/api_service.dart';
import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:stacked/stacked.dart';
import 'package:translator/translator.dart';

class RandomPictureViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();
  SharedService _sharedService = locator<SharedService>();
  final translator = GoogleTranslator();
  ApodDto? _apodDto;
  get apodDto => _apodDto;
  bool isLoading = true;

  Future<void> setPicture() async {
    _apodDto = await _apiService.getPictureOfDay();
    isLoading = false;
    notifyListeners();
  }

  RandomPictureViewModel() {
    setPicture();
  }

  translate(String input) async{
    translator
        .translate(input, to: await _sharedService.getCurrentLanguage())
        .then((result) => result);
  }
}