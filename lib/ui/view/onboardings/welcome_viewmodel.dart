import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/app/app.router.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart' as loc;

class WelcomeViewModel extends BaseViewModel {
  var _navigator = locator<NavigationService>();
  SharedService _sharedService = SharedService();
  DialogService _dialogService = locator<DialogService>();

  bool? isFirstEntry;

  Future<void> _viewPreload() async {
    isFirstEntry = await _sharedService.getFirstEntry();
    print(isFirstEntry);
    notifyListeners();
  }

  WelcomeViewModel() {
    _viewPreload();
  }

  showHelpDialog(int index) async {
    var response = await _dialogService.showCustomDialog(
      data: index,
      variant: DialogType.help,
      title: loc.tr(ConstKeys.help_content[index][ConstKeys.help_titles]),
      description:
          loc.tr(ConstKeys.help_content[index][ConstKeys.help_subtitles]),
      imageUrl: ConstPaths.help_content_images[index],
      hasImage: ConstPaths.help_animations[index] != null,
      mainButtonTitle:
          loc.tr(ConstKeys.help_content[index][ConstKeys.help_buttons]),
    );
    if (response!.confirmed == true && index < ConstKeys.help_content.length)
      showHelpDialog(index + 1);
  }

  navigateToRandomPicture() async {
    _navigator.replaceWith(Routes.homeView);
    if (await _sharedService.getFirstEntry()) {
      _sharedService.isFirstEntry = false;
      await showHelpDialog(0);
    }
  }
}
