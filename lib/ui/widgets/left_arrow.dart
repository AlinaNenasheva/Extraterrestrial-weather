import 'package:flutter/material.dart';

Widget getLeftArrow(BuildContext context, PageController _controller) {
  return Positioned(
      left: 0,
      top: MediaQuery.of(context).size.height / 2 - 30.0,
      child: Container(
        height: 60.0,
        width: 30.0,
        alignment: Alignment.centerLeft,
        decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: new BorderRadius.only(
            topRight: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          ),
        ),
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 0.0) {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut);
            }
          },
          child: IconButton(
            iconSize: 18.0,
            padding: EdgeInsets.only(right: 5.0),
            icon: Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              _controller.previousPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut);
            },
          ),
        ),
      ));
}