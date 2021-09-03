import 'package:extraterrestrial_weather/app/app.locator.dart';
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
              width: MediaQuery.of(context).size.width + 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/mars_weather_bg.png"),
                      fit: BoxFit.fill)),
            ),
            Container(
              padding: EdgeInsets.only(top: 150.0, left: 32.0, right: 32.0),
              child: model.isLoading ? CircularProgressIndicator(): Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Latest Weather at Gale Crater',
                      style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Sol ${model.solWeatherDto[0].sol}",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "${model.solWeatherDto[0].terrestrialDate}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  Text(
                    "High: ${model.solWeatherDto[0].highCelsius} °C",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Low: ${model.solWeatherDto[0].highCelsius} °C",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Low: ${model.solWeatherDto[0].pressure} Pa(${model.solWeatherDto[0].pressureStatus})",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Sunrise: ${model.solWeatherDto[0].sunrise}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    "Sunset: ${model.solWeatherDto[0].sunrise}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              color: Color(0xFF5d6475),
                            ),
                          );
                        }
                    ),
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