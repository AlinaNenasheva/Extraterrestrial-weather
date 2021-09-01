import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final double width;
  final double height;

  RadioButton(
      {required this.value,
        required this.groupValue,
        this.width = 25,
        this.height = 25});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: value == groupValue ? Colors.white : Colors.black
            )
        ),
        child: Center(
          child: Container(
            height: this.height - 1.0,
            width: this.width - 1.0,
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: Colors.transparent,
            ),
            child: Center(
              child: Container(
                  height: this.height - 8.0,
                  width: this.width - 8.0,
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    color: value == groupValue ? Colors.black : Colors.transparent,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}