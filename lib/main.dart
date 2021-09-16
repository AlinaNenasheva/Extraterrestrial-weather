import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/ui/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'app/setup_dialog_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupDialogUi();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru')],
        path: ConstPaths.langs,
        saveLocale: true,
        fallbackLocale: Locale('en'),
        useOnlyLangCode: true,
        child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(
      Audio(
        ConstPaths.background_music,
      ),
    );
    _assetsAudioPlayer.playOrPause();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeService.mainTheme,
    );
  }
}
