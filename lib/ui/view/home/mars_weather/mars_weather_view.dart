import 'package:extraterrestrial_weather/app/app.locator.dart';
import 'package:extraterrestrial_weather/consts/const_keys.dart';
import 'package:extraterrestrial_weather/consts/const_paths.dart';
import 'package:extraterrestrial_weather/ui/widgets/last_sol_info.dart';
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
                    image: AssetImage(ConstPaths.mars_weather_bg),
                    fit: BoxFit.fill)),
          ),
          Container(
            padding: EdgeInsets.only(top: 150.0),
            child: model.isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : SolInfo(model.getLatestDay(), model.getOtherDays())
          )
        ]),
      ),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      viewModelBuilder: () => locator<MarsWeatherViewModel>(),
    );
  }
}
