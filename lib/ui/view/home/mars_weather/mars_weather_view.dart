import 'package:extraterrestrial_weather/ui/widgets/right_arrow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'mars_weather_viewmodel.dart';

class MarsWeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarsWeatherViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/mars_weather_bg.png"),
                      fit: BoxFit.fill)),
            ),
            getRightArrow(context)
          ]
        ),
      ),
      viewModelBuilder: () => MarsWeatherViewModel(),
    );
  }
}