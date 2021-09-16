import 'package:extraterrestrial_weather/consts/const_keys.dart' as Consts;
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked_services/stacked_services.dart';

class HelpDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  HelpDialog({Key? key, required this.request, required this.completer});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        request.title!,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.description!,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          Stack(
            children: [
              Image.asset(request.imageUrl!),
              if (request.hasImage!)
                Positioned(
                    top: 50.0,
                    right: 50.0,
                    child: Lottie.asset(ConstPaths.help_animations[request.data],
                        height: 50.0))
            ],
          )
        ],
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () => completer(DialogResponse(confirmed: true)),
            child: Text(
              request.mainButtonTitle!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.generate(
                Consts.ConstKeys.help_content.length,
                (i) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 3.0),
                      height: 5.0,
                      width: 5.0,
                      decoration: BoxDecoration(
                          color: i <= request.data
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(5.0)),
                    )),
          ),
        )
      ],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
      actionsPadding: EdgeInsets.only(bottom: 14.0),
      titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
    );
  }
}
