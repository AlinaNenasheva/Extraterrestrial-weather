import 'dart:ui';

import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/ui/view/home/random_picture/random_picture_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
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
                    image: AssetImage("assets/images/random_picture_bg.png"),
                    fit: BoxFit.fill)),
          ),
          model.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Column(
                  children: [
                    SizedBox(height: 80.0),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 2 - 80.0,
                          width: MediaQuery.of(context).size.width - 32.0 * 2,
                          child: GestureDetector(
                            onDoubleTap:
                                !model.isLiked ? () => model.likeImage() : null,
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity: model.isLiked ? 0.8 : 1,
                                  child: AbsorbPointer(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(16.0),
                                          topLeft: Radius.circular(16.0)),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height / 2 - 80.0,
                                        width: MediaQuery.of(context).size.width - 32.0 * 2,
                                        child: Image.network(
                                          model.apodDto!.HDUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: model.isLiked ? 1.0 : 0,
                                  child: Center(
                                      child: Image.asset(
                                    "assets/images/like.png",
                                    width: 100,
                                  )),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 32.0, right: 32.0, bottom: 80.0),
                        padding: EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF5d6475),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0))),
                        child: RawScrollbar(
                          thumbColor: Colors.white,
                          thickness: 2.0,
                          radius: Radius.circular(11.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(
                                    "${ConstKeys.today_picture.tr()} \n${model.apodDto!.title}",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      bottom: 16.0,
                                      top: 8.0),
                                  child: Text(
                                    model.apodDto!.explanation,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
        ]),
      ),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<RandomPictureViewModel>(),
    );
  }
}
