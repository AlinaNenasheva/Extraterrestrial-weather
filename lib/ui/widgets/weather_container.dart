import 'package:extraterrestrial_weather/models/sol_weather_dto.dart';
import 'package:flutter/material.dart';

Widget getWeatherContainer(BuildContext context, SolWeatherDto weatherDay) {
  return Container(
    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0, bottom: 80.0),
    padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0, bottom: 30.0),
    width: 250.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: Color(0xFF5d6475).withOpacity(0.5),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 15.0),
          child: Text("Sol ${weatherDay.sol}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Text("${weatherDay.terrestrialDate}",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Divider(),
        Text("High: ${weatherDay.highCelsius} °C",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text("Low: ${weatherDay.lowCelsius} °C",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text("Pressure: ${weatherDay.pressure}",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text("(${weatherDay.pressureStatus})",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${weatherDay.sunrise} "),
            Image.asset("assets/sunrise.png", color: Colors.white, width: 20.0,),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${weatherDay.sunset} "),
            Image.asset("assets/sunset.png", color: Colors.white, width: 20.0,),
          ],
        )
      ],
    ),
  );
}
