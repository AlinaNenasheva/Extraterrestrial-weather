import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';
import 'package:extraterrestrial_weather/services/api_service.dart';
import 'package:stacked/stacked.dart';

class MarsWeatherViewModel extends BaseViewModel {

  ApiService _apiService = locator<ApiService>();

  List<SolWeatherDto> _solWeatherDto = [];
  bool isLoading = true;

  Future<void> setWeather() async {
    _solWeatherDto = await _apiService.getWeather();
    isLoading = false;
    notifyListeners();
  }

  MarsWeatherViewModel() {
    setWeather();
  }

  getLatestDay() => _solWeatherDto[0];

  getOtherDaysLength() => _solWeatherDto.sublist(0, 6).length;

  getOtherDays() => _solWeatherDto.sublist(0, 6);
}