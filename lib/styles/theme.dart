import 'package:flutter/material.dart';
import 'package:drohealth_assessment/styles/colors.dart';

ThemeData appThemeData() {
  final base = ThemeData.dark();
  return base.copyWith(
    textSelectionHandleColor: appPurple,
    highlightColor: appPurple,
    cursorColor: appPurple,
    appBarTheme: base.appBarTheme.copyWith(
      color: appTransparent,
      elevation: 0,
    ),
    tabBarTheme: base.tabBarTheme.copyWith(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: appPurple,
        ),
      ),
      unselectedLabelColor: appDarkGrey,
      labelColor: appBlack,
    ),
    brightness: Brightness.light,
    bottomAppBarColor: appTransparent,
    accentColor: purple,
    primaryColor: white,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: appPurple,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
      backgroundColor: appPurple,
      foregroundColor: appWhite,
    ),
    popupMenuTheme: base.popupMenuTheme.copyWith(color: appGrey),
    scaffoldBackgroundColor: appWhite,
    backgroundColor: appWhite,
    cardColor: white,
    textSelectionColor: appPurple.withOpacity(.4),
    errorColor: appRed,
    textTheme: base.textTheme.apply(
      displayColor: appBlack,
      bodyColor: appBlack,
      fontFamily: 'ProximaNova',
    ),
    primaryIconTheme: base.iconTheme.copyWith(
      size: 30,
      color: appBlack,
    ),
    indicatorColor: appPurple,
    inputDecorationTheme: InputDecorationTheme(
      errorMaxLines: 3,
      helperMaxLines: 3,
      isDense: true,
      filled: false,
      suffixStyle: TextStyle(color: appBlack.withOpacity(.5)),
      prefixStyle: TextStyle(color: appBlack.withOpacity(.5)),
      labelStyle: TextStyle(
        color: appBlack.withOpacity(.5),
        fontSize: base.textTheme.bodyText1.fontSize,
      ),
      helperStyle: TextStyle(
        color: appBlack.withOpacity(.5),
        fontSize: base.textTheme.bodyText1.fontSize,
      ),
      hintStyle: TextStyle(
        color: appBlack.withOpacity(.5),
        fontSize: base.textTheme.bodyText1.fontSize,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appRed,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: appRed,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.withOpacity(.6), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    iconTheme: base.iconTheme.copyWith(
      color: appBlack,
      size: 30,
    ),
  );
}
