import 'package:easy_localization/easy_localization.dart';
import 'package:extraterrestrial_weather/services/shared_service.dart';
import 'package:extraterrestrial_weather/services/theme_service.dart';
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
      path: 'assets/lang/',
      saveLocale: true,
      fallbackLocale: Locale('en'),
      useOnlyLangCode: true,
      child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeService.darkTheme,
    );
  }
}
