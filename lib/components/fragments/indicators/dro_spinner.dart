import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';

class DROSpinner extends StatelessWidget {
  final Brightness brightness;
  const DROSpinner({this.brightness = Brightness.light});

  @override
  Widget build(BuildContext context) {
    final sizer = AppScaleUtil(context).sizer;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: sizer.setHeight(5),
          width: sizer.setHeight(5),
        ),
        child: Theme.of(context).platform == TargetPlatform.iOS
            ? CupertinoTheme(
                data:
                    CupertinoTheme.of(context).copyWith(brightness: brightness),
                child: CupertinoActivityIndicator(
                  radius: sizer.setWidth(4),
                ),
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(appPurple),
              ),
      ),
    );
  }
}
