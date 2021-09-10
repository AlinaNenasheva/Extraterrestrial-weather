import 'package:extraterrestrial_weather/ui/view/home/mars_weather/mars_weather_view.dart';
import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_view.dart';
import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_viewmodel.dart';
import 'package:extraterrestrial_weather/ui/view/home/settings/settings_view.dart';
import 'package:extraterrestrial_weather/ui/view/onboardings/welcome_view.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  int _pageCounter = 1;

  int get pageCounter => _pageCounter;

  List _pages = [MarsWeatherView(), RandomPictureView(), SettingsView()];

  getNumberOfViews() => _pages.length;

  getView(int index) {
    return _pages[index];
  }

  void updatePageCounter(int page) {
    _pageCounter = page;
    notifyListeners();
  }
}
