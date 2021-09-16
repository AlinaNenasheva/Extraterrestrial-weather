import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/app/app.router.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:translator/translator.dart';

class SettingsViewModel extends BaseViewModel {
  var _dialogService = locator<DialogService>();
  var _randomPictureViewModel = locator<RandomPictureViewModel>();
  var _navigator = locator<NavigationService>();
  var _sharedService = SharedService();
  final  _translator = GoogleTranslator();

  getSettingsOptions(String option) {
    switch (option) {
      case "language":
        _onLanguageOptionPressed();
        break;
      case "help":
        showHelpDialog(0);
        break;
      case "liked_photos":
        _navigateToLikedPhotos();
        break;
      default:
        return () {};
    }
  }

  void _onLanguageOptionPressed() async {
    var response = await _dialogService.showCustomDialog(
      data: await _sharedService.getCurrentLanguage(),
      variant: DialogType.language,
      title: loc.tr(ConstKeys.choose_language),
      mainButtonTitle: loc.tr(ConstKeys.back),
    );
    if (response!.confirmed) {
      _sharedService.currentLanguage = response.data;
        _randomPictureViewModel.apodDto!.title = (await
        _translator.translate(_randomPictureViewModel.apodDto!.title, to: response.data)).text;
        _randomPictureViewModel.apodDto!.explanation = (await
        _translator.translate(_randomPictureViewModel.apodDto!.explanation, to: response.data)).text;
    }
  }

  showHelpDialog(int index) async {
    await _dialogService.showCustomDialog(
      data: index,
      variant: DialogType.help,
      title: loc.tr(ConstKeys.help_content[index][ConstKeys.help_titles]),
      description: loc.tr(ConstKeys.help_content[index][ConstKeys.help_subtitles]),
      hasImage: ConstPaths.help_animations[index] != null,
      imageUrl: ConstPaths.help_content_images[index],
      mainButtonTitle: loc.tr(ConstKeys.help_content[index][ConstKeys.help_buttons]),
    );
    if (index < ConstKeys.help_content.length - 1)
      showHelpDialog(index + 1);
  }

  _navigateToLikedPhotos() {
    _navigator.navigateTo(Routes.likedImagesView);
  }
}
