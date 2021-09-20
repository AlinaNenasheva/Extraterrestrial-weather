import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:flutter/material.dart';

class PreviewContainer extends StatelessWidget {
  final String url;
  final VoidCallback onDeletePressed;

  PreviewContainer(this.url, this.onDeletePressed);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(color: Colors.white)),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              child: Image.network(url, fit: BoxFit.cover),
            ),
          ),
        ),
        IconButton(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.zero,
          onPressed: onDeletePressed,
          icon: Image.asset(
            ConstPaths.close,
            height: 24.0,
            width: 24.0,
          ),
        ),
      ],
    );
  }
}
