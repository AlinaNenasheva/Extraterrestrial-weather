import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/services/api_service/models/apod_dto.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ApodImageWithExplanation extends StatelessWidget {

  final ApodDto apodDto;
  final bool isLiked;
  final VoidCallback likeImage;

  ApodImageWithExplanation(this.apodDto, this.isLiked, this.likeImage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80.0),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
              height: MediaQuery.of(context).size.height / 2 - 80.0,
              width: MediaQuery.of(context).size.width - 32.0 * 2,
              child: GestureDetector(
                onDoubleTap:
                !isLiked ? () => likeImage() : null,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: isLiked ? 0.8 : 1,
                      child: AbsorbPointer(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16.0),
                              topLeft: Radius.circular(16.0)),
                          child: Container(
                            height:
                            MediaQuery.of(context).size.height /
                                2 -
                                80.0,
                            width:
                            MediaQuery.of(context).size.width -
                                32.0 * 2,
                            child: CachedNetworkImage(
                              placeholder: (context, url) =>
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                              imageUrl: apodDto.url!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: isLiked ? 1.0 : 0,
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
                color: Theme.of(context).primaryColor,
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
                        "${ConstKeys.today_picture.tr()} \n${apodDto!.title}",
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
                        apodDto!.explanation!,
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
    );
  }

}