import 'package:extraterrestrial_weather/consts/const_keys.dart' as Consts;
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class HelpDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  HelpDialog(
      {Key? key, required this.request, required this.completer});

  int selectedLanguage = 0;

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
      actions: [
        Center(
          child: TextButton(
            onPressed: () => completer(
                DialogResponse(confirmed: true, data: selectedLanguage)),
            child: Text(request.mainButtonTitle!, style: Theme.of(context).textTheme.bodyText1,),
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