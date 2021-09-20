import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:extraterrestrial_weather/ui/widgets/apod_image_with%20explanation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RandomPictureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RandomPictureViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(children: [
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width + 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ConstPaths.random_picture_bg),
                    fit: BoxFit.fill)),
          ),
          model.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : ApodImageWithExplanation(model.apodDto!, model.isLiked, model.likeImage)
        ]),
      ),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<RandomPictureViewModel>(),
    );
  }
}
