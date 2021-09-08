
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import 'liked_images_viewmodel.dart';

class LikedImagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LikedImagesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(children: [
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width + 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/liked_photos_bg.jpg"),
                    fit: BoxFit.fill)),
          ),
          Container(
            padding: EdgeInsets.only(top: 80.0, left: 32.0, right: 32.0),

          ),
        ]),
      ),
      viewModelBuilder: () => LikedImagesViewModel(),
    );
  }
}
