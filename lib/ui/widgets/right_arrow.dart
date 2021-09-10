import 'package:flutter/material.dart';

Widget getRightArrow(BuildContext context, PageController _controller) {
  return Positioned(
      right: 0,
      top: MediaQuery.of(context).size.height / 2 - 30.0,
      child: Container(
        height: 60.0,
        width: 30.0,
        alignment: Alignment.centerRight,
        decoration: new BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            bottomLeft: const Radius.circular(40.0),
          ),
        ),
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx < 0.0) {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut);
            }
          },
          child: IconButton(
            iconSize: 18.0,
            padding: EdgeInsets.only(left: 5.0),
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: () {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeInOut);
            },
          ),
        ),
      ));
}
