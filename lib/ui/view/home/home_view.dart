import 'package:extraterrestrial_weather/ui/view/home/home_viewmodel.dart';
import 'package:extraterrestrial_weather/ui/widgets/left_arrow.dart';
import 'package:extraterrestrial_weather/ui/widgets/right_arrow.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final _pageViewController = new PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageViewController,
              itemCount: model.getNumberOfViews(),
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  if (_pageViewController.page != null)
                    model.updatePageCounter(_pageViewController.page!.round());
                });
                return model.getView(index);
              },
            ),
            if (model.pageCounter != model.getNumberOfViews() - 1)
              RightArrow(_pageViewController),
            if (model.pageCounter != 0)
              LeftArrow(_pageViewController),
            Positioned(
              bottom: 50,
              right: MediaQuery.of(context).size.width / 2 - 28.0,
              child: Row(
                children: List<Widget>.generate(
                    model.getNumberOfViews(),
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                          height: 12.0,
                          width: model.pageCounter == index ? 22.0 : 12.0,
                          decoration: BoxDecoration(
                              color: model.pageCounter == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(6.0)),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        )),
              ),
            )
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
