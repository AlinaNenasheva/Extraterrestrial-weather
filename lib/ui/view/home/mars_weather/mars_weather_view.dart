import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/ui/widgets/right_arrow.dart';
import 'package:extraterrestrial_weather/ui/widgets/weather_container.dart';
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
              width: MediaQuery.of(context).size.width + 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/mars_weather_bg.png"),
                      fit: BoxFit.fill)),
            ),
            Container(
              padding: EdgeInsets.only(top: 150.0),
              child: model.isLoading ? CircularProgressIndicator(): Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0, left: 32.0, right: 32.0),
                    child: Text(
                      'Latest Weather at Gale Crater',
                      style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0, left: 32.0, right: 32.0),
                    child: Text(
                      "Sol ${model.getLatestDay().sol}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0, left: 32.0, right: 32.0),
                    child: Text(
                      "${model.getLatestDay().terrestrialDate}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Text(
                    "High: ${model.getLatestDay().highCelsius} °C)",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Low: ${model.getLatestDay().lowCelsius} °C",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Low: ${model.getLatestDay().pressure} Pa(${model.getLatestDay().pressureStatus})",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Sunrise: ${model.getLatestDay().sunrise}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Sunset: ${model.getLatestDay().sunrise}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: model.getOtherDaysLength(),
                          itemBuilder: (context, index) {
                            return getWeatherContainer(context, model.getOtherDays()[index]);
                          }
                    )
                    // child: ListView.builder(
                    //   shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: model.getOtherDaysLength(),
                    //     itemBuilder: (context, index) {
                    //       return getWeatherContainer(context, model.getOtherDays()[index]);
                    //     }
                    // ),
                  )
                ],
              ),
            )
          ]
        ),
      ),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<MarsWeatherViewModel>(),
    );
  }
}