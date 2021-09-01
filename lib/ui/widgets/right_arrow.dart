import 'package:flutter/material.dart';

Widget getRightArrow(BuildContext context) {
  return Positioned(
      right: 0,
      top: MediaQuery.of(context).size.height / 2 - 30.0,
      child: Container(
        height: 60.0,
        width: 36.0,
        alignment: Alignment.centerRight,
        decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            bottomLeft: const Radius.circular(40.0),
          ),
        ),
        child: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 24.0,
        ),
      )
  );
}