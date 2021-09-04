import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/models/apod_dto.dart';
import 'package:extraterrestrial_weather/services/api_service.dart';
import 'package:stacked/stacked.dart';

class RandomPictureViewModel extends BaseViewModel {
  ApiService _apiService = locator<ApiService>();

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
}