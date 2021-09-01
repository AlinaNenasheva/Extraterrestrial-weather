import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_viewmodel.dart';
import 'package:extraterrestrial_weather/ui/widgets/left_arrow.dart';
import 'package:extraterrestrial_weather/ui/widgets/right_arrow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RandomPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RandomPictureViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/random_picture_bg.png"),
                      fit: BoxFit.fill)),
            ),
            getRightArrow(context),
            getLeftArrow(context)
          ]
        ),
      ),
      viewModelBuilder: () => RandomPictureViewModel(),
    );
  }
}