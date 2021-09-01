import 'package:flutter/material.dart';

Widget getLeftArrow(BuildContext context) {
  return Positioned(
      left: 0,
      top: MediaQuery.of(context).size.height / 2 - 30.0,
      child: Container(
        height: 60.0,
        width: 36.0,
        alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: new BorderRadius.only(
            topRight: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          ),
        ),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: 24.0,
        ),
      ));
}