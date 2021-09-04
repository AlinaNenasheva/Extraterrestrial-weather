import 'package:extraterrestrial_weather/app/app.locator.dart';
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
        body: Stack(children: [
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width + 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/random_picture_bg.png"),
                    fit: BoxFit.fill)),
          ),
          Container(
            padding: EdgeInsets.only(top: 80.0, left: 32.0, right: 32.0, bottom: 80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                model.isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ))
                    : Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          child: Image.network(
                            model.apodDto.HDUrl,
                          ),
                        )
                      ]),
                Container(
                  height: 330.0,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF5d6475).withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Today's picture is ... \n${model.apodDto.title}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          model.apodDto.explanation,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<RandomPictureViewModel>(),
    );
  }
}
