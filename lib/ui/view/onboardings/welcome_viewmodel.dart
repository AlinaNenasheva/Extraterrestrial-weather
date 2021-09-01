import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeViewModel extends BaseViewModel {

  var _navigator = locator<NavigationService>();

  navigateToRandomPicture() {
    _navigator.replaceWith(Routes.homeView);
  }
}