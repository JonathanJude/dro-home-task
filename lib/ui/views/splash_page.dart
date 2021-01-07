import 'dart:async';

import 'package:drohealth_assessment/ui/views/store.dart';
import 'package:flutter/material.dart';
import 'package:drohealth_assessment/components/typography/app_text.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/styles/text_styles.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';

class SplashPage extends StatelessWidget with WidgetsBindingObserver {
  void _routingHandler(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StoreScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    WidgetsBinding.instance.addPostFrameCallback(
      (timing) {
        Timer(
          Duration(seconds: 2),
          () {
            _routingHandler(context);
          },
        );
      },
    );

    final scaler = AppScaleUtil(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/raster/logo.png',
                  height: size.height * .32, width: size.width * .32),
            ],
          ),
        ),
        padding: scaler.insets.symmetric(
          horizontal: 5,
        ),
      ),
    );
  }
}
