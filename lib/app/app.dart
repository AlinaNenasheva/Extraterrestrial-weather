import 'package:extraterrestrial_weather/services/api_service.dart';
import 'package:extraterrestrial_weather/ui/view/home/home_view.dart';
import 'package:extraterrestrial_weather/ui/view/home/mars_weather/mars_weather_view.dart';
import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_view.dart';
import 'package:extraterrestrial_weather/ui/view/home/settings/settings_view.dart';
import 'package:extraterrestrial_weather/ui/view/onboardings/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  dependencies: [
    LazySingleton(classType: ApiService),
    LazySingleton(classType: NavigationService),
  ],
  routes: [
    MaterialRoute(page: WelcomeView, initial: true),
    CupertinoRoute(page: RandomPictureView),
    CupertinoRoute(page: MarsWeatherView),
    CupertinoRoute(page: SettingsView),
    CupertinoRoute(page: HomeView),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}