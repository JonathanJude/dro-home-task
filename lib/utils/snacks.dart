import 'package:flutter/material.dart';
import 'package:drohealth_assessment/components/typography/app_text.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/styles/text_styles.dart';

enum SnackType { Default, Error, Info, Success, Warning }

showSnack({
  @required BuildContext context,
  @required String message,
}) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: AppText(
        message,
        textAlign: TextAlign.center,
        style: normalText.copyWith(
          color: appWhite,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: appYellow,
    ),
  );
}
