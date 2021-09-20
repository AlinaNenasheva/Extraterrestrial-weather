import 'package:easy_localization/easy_localization.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/services/api_service/models/sol_weather_dto.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {

  final SolWeatherDto weatherDay;

  WeatherContainer(this.weatherDay);

  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0, bottom: 80.0),
      padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0, bottom: 30.0),
      width: 250.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        color: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              "${ConstKeys.sol.tr()} ${weatherDay.sol}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Text(
            "${DateFormat.yMMMMd(context.locale.languageCode).format(weatherDay.terrestrialDate)}",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Divider(),
          Text(
            "${ConstKeys.high.tr()}: ${weatherDay.highCelsius} °C",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            "${ConstKeys.low.tr()}: ${weatherDay.lowCelsius} °C",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            "${ConstKeys.pressure.tr()}: ${weatherDay.pressure} ${ConstKeys.pa.tr()}",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weatherDay.sunrise} ",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Image.asset(
                ConstPaths.sunrise,
                color: Colors.white,
                width: 20.0,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weatherDay.sunset} ",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Image.asset(
                ConstPaths.sunset,
                color: Colors.white,
                width: 20.0,
              ),
            ],
          )
        ],
      ),
    );
  }

}