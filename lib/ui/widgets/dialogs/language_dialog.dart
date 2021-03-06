import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import '../radiobutton.dart';

class LanguageDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  LanguageDialog({required this.request, required this.completer});

  @override
  createState() => new _LanguageDialogState(
      request: this.request, completer: this.completer);
}

class _LanguageDialogState extends State<LanguageDialog> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  _LanguageDialogState(
      {Key? key, required this.request, required this.completer});

  int selectedLanguage = 0;

  @override
  void initState() {
    if (request.data != null) {
      switch (request.data) {
        case 'en':
          selectedLanguage = 1;
          break;
        case 'ru':
          selectedLanguage = 0;
          break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Text(
            request.title!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Container(
        width: double.maxFinite,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: ConstKeys.supportedLanguages.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              minLeadingWidth: 8.0,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ConstPaths.supported_languages_icons[index],
                    height: 20,
                    width: 28,
                  ),
                ],
              ),
              title: Text(
                loc.tr(ConstKeys.supportedLanguages[index]),
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: RadioButton(
                  groupValue: selectedLanguage,
                  value: index,
                  height: 20.0,
                  width: 20.0),
              onTap: () => setState(() {
                selectedLanguage = index;
                switch (selectedLanguage) {
                  case 0:
                    context.setLocale(Locale('ru'));
                    return completer(
                        DialogResponse(confirmed: true, data: 'ru'));
                  case 1:
                    context.setLocale(Locale('en'));
                    return completer(
                        DialogResponse(confirmed: true, data: 'en'));
                }
              }),
            );
          },
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => completer(DialogResponse(confirmed: false)),
            child: Text(
              request.mainButtonTitle!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
      titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
    );
  }
}
