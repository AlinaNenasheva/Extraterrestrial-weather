import 'package:extraterrestrial_weather/ui/view/onboardings/welcome_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/welcome_bg.jpg"),
                  fit: BoxFit.cover)),
          padding:
              EdgeInsets.only(top: 80.0, bottom: 40, left: 32.0, right: 32.0),
          child: Column(
            children: [
              Text(
                'Welcome to extraterrestrial weather!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80.0),
                child: Text(
                  'Feel out of the Earth and discover stars in the elevating journey straight to the stars!',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              MaterialButton(
                height: 52.0,
                minWidth: double.maxFinite,
                color: Colors.white.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Text(
                  "Explore more",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onPressed: () => model.navigateToRandomPicture(),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => WelcomeViewModel(),
    );
  }
}
