import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/services/api_service/models/sol_weather_dto.dart';
import 'package:extraterrestrial_weather/ui/widgets/weather_container.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SolInfo extends StatelessWidget {

  final SolWeatherDto lastSolWeatherDto;
  final List<SolWeatherDto> otherSolWeatherDto;

  const SolInfo(this.lastSolWeatherDto, this.otherSolWeatherDto, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            "${ConstKeys.sol.tr()} ${lastSolWeatherDto.sol}",
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
                  "${DateFormat.yMMMMd(context.locale.languageCode).format(lastSolWeatherDto.terrestrialDate)}",
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
                  "${lastSolWeatherDto.highCelsius} °C",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  "${lastSolWeatherDto.lowCelsius} °C",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  "${lastSolWeatherDto.pressure} ${ConstKeys.pa.tr()}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  "${lastSolWeatherDto.sunrise}",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  "${lastSolWeatherDto.sunset}",
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
                itemCount: otherSolWeatherDto.length,
                itemBuilder: (context, index) {
                  return WeatherContainer(otherSolWeatherDto[index]);
                }))
      ],
    );
  }
}
