import 'dart:ui';

import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/ui/widgets/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import 'liked_images_viewmodel.dart';

class LikedImagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LikedImagesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            "assets/images/liked_photos_bg.jpg",
            fit: BoxFit.cover,
          ),
          Positioned.fill(
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 80.0, left: 32.0, right: 32.0),
            child: Column(
              children: [
                Text(
                  loc.tr(ConstKeys.settings[0]),
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 13,
                    childAspectRatio: 10 / 15,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(model.images.length, (index) {
                      return previewContainer(model.images[index].hdURL,
                          () => model.deleteImage(model.images[index].hdURL));
                    })),
              ],
            ),
          ),
        ]),
      ),
      viewModelBuilder: () => LikedImagesViewModel(),
    );
  }
}
