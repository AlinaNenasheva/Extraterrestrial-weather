import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/ui/widgets/right_arrow.dart';
import 'package:extraterrestrial_weather/ui/widgets/weather_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'mars_weather_viewmodel.dart';

class MarsWeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MarsWeatherViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(children: [
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width + 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ConstPaths.marsWeatherBG),
                    fit: BoxFit.fill)),
          ),
          Container(
            padding: EdgeInsets.only(top: 150.0),
            child: model.isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.0, left: 32.0, right: 32.0),
                        child: Text(
                          ConstKeys.mars_weather_title.tr(),
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 15.0, left: 32.0, right: 32.0),
                        child: Text(
                          "${ConstKeys.sol.tr()} ${model.getLatestDay().sol}",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${DateFormat.yMMMMd(context.locale.languageCode).format(model.getLatestDay().terrestrialDate)}",
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Text(
                                ConstKeys.high.tr(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                ConstKeys.low.tr(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                ConstKeys.pressure.tr(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                ConstKeys.sunrise.tr(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                ConstKeys.sunset.tr(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Tooltip(
                                message: ConstKeys.info.tr(),
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor),
                                preferBelow: false,
                                child: Image.asset(
                                  ConstPaths.info,
                                  height: 18.0,
                                ),
                              ),
                              Text(
                                "${model.getLatestDay().highCelsius} °C",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                "${model.getLatestDay().lowCelsius} °C",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                "${model.getLatestDay().pressure} ${ConstKeys.pa.tr()}",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                "${model.getLatestDay().sunrise}",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text(
                                "${model.getLatestDay().sunset}",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Flexible(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: model.getOtherDaysLength(),
                              itemBuilder: (context, index) {
                                return WeatherContainer(model.getOtherDays()[index]);
                              }))
                    ],
                  ),
          )
        ]),
      ),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<MarsWeatherViewModel>(),
    );
  }
}
