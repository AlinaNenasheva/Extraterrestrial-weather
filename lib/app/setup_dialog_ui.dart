import 'package:extraterrestrial_weather/consts/enums.dart';
import 'package:extraterrestrial_weather/ui/widgets/dialogs/help_dialog.dart';
import 'package:extraterrestrial_weather/ui/widgets/dialogs/language_dialog.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.language: (context, sheetRequest, completer) =>
        LanguageDialog(request: sheetRequest, completer: completer),
    // DialogType.theme: (context, sheetRequest, completer) =>
    //     RadioButtonDialog(request: sheetRequest, completer: completer),
    DialogType.help: (context, sheetRequest, completer) =>
        HelpDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}