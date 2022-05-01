import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ubx_vinne_admin_web/src/base/base_view.dart';
import 'package:ubx_vinne_admin_web/src/ui/walkthrough/widgets/circle_dot_indicator.dart';
import 'package:ubx_vinne_admin_web/src/utils/constants/app_colors.dart';
import 'package:ubx_vinne_admin_web/src/utils/constants/app_icons.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends BaseView<WalkThroughScreen> {
  late PageController _pageController;

  static const _duration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  @override
  void onStart() {
    _pageController = PageController();
  }

  @override
  Widget onBuild(BuildContext context, BoxConstraints constraints) {
    List<Widget> pages = <Widget>[
      walkThroughPlaceHolder(
        iconImage: AppIcons.walkOne,
        tagTitle: 'Delicious Indian\nStreet foods\n\n',
        tagHeadline: 'Enjoy different delicious\nindian street foods online',
      ),
      walkThroughPlaceHolder(
        iconImage: AppIcons.walkTwo,
        tagTitle: 'Enjoy\nDelicious Pizza\n\n',
        tagHeadline: 'Enjoy different delicious\npizzas online',
      ),
      walkThroughPlaceHolder(
        iconImage: AppIcons.walkThree,
        tagTitle: 'Delicious in\njust 10 mins\n\n',
        tagHeadline:
            'Get your favourite food delivered\nin just 10 mins at your doorstep',
      ),
    ];

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              PageView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: pages.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return pages[index % pages.length];
                },
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: Column(
                    children: [
                      Center(
                        child: DotsIndicator(
                          controller: _pageController,
                          itemCount: pages.length,
                          onPageSelected: (int page) {
                            _pageController.animateToPage(page,
                                duration: _duration, curve: _kCurve);
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.bottomRight,
                        padding: EdgeInsets.only(bottom: 20, right: 20),
                        margin: EdgeInsets.only(top: 50),
                        child: InkWell(
                          onTap: () {
                            _pageController.nextPage(
                              duration: _duration,
                              curve: _kCurve,
                            );
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget walkThroughPlaceHolder({
    required String iconImage,
    required String tagTitle,
    required String tagHeadline,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconImage,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
          ),
          RichText(
            text: TextSpan(
              text: tagTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                height: 1.1,
              ),
              children: [
                TextSpan(
                  text: tagHeadline,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.3,
                  ),
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox.square(
            dimension: 100,
          )
        ],
      ),
    );
  }

  @override
  void onStop() {
    // TODO: implement onStop
  }
}
