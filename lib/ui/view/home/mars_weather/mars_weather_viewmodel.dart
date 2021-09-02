import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/models/sol_weather.dart';
import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';
import 'package:extraterrestrial_weather/services/api_service.dart';
import 'package:stacked/stacked.dart';

class MarsWeatherViewModel extends BaseViewModel {

  ApiService _apiService = locator<ApiService>();

  List<SolWeatherDto> solWeatherDto = [];
  bool isLoading = true;

  Future<void> setWeather() async {
    solWeatherDto = await _apiService.getWeather();
    isLoading = false;
    notifyListeners();
  }

  MarsWeatherViewModel() {
    setWeather();
  }
}