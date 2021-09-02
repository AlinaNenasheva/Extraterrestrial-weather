import 'package:extraterrestrial_weather/consts/const_strings.dart' as Consts;
import 'package:extraterrestrial_weather/ui/widgets/left_arrow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(children: [
          Container(
            height: double.maxFinite,
            width: MediaQuery.of(context).size.width + 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/settings_bg.png"),
                    fit: BoxFit.fill)),
          ),
          Container(
            padding: EdgeInsets.only(top: 80.0, left: 32.0, right: 32.0),
            child: Column(
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(height: 80.0,),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Consts.settings.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: index == 0 ? BorderRadius.only(
                                      topRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0)) :
                                  index == Consts.settings.length - 1 ?
                                  BorderRadius.only(
                                      bottomRight: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0)) :
                                  BorderRadius.zero,
                                  color: Color(0xFF5d6475).withOpacity(0.3),
                                ),
                                child: Center(child: Text(Consts.settings[index])),
                              ),
                              onTap: () => model.getSettingsOptions(Consts.settings[index])
                            ),
                            if (index != Consts.settings.length - 1)
                              Divider(height: 0.5)
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
        ]),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
