import 'package:flutter/material.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';
import 'package:drohealth_assessment/utils/typedefs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ActionButton extends StatelessWidget {
  final OnPressed onPressed;
  final Color color;
  final Color textColor;
  final String text;
  final bool disabled;
  final IconData  icon;
  final double borderRadius;
  final double height;
  final double textFontSize;

  ActionButton({
    @required this.text,
    @required this.onPressed,
    this.disabled = false,
    this.color = appPurple,
    this.textColor = appWhite,
    this.icon,
    this.borderRadius = 14.0,
    this.height = 50.0,
    this.textFontSize = 13.0,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: disabled ? .4 : 1,
              child: Container(
                height: height,
                width: MediaQuery.of(context).size.width * .7,
                child: FlatButton(
                  onPressed: disabled ? null : onPressed,
                  color: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius)),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: height),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           icon == null ? SizedBox() : Icon(MdiIcons.cartOutline, size: 27),
                          Padding(
                            padding: scaler.insets.symmetric(
                              horizontal: 4.0,
                            ),
                            child: Text(
                              text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: textColor ?? Colors.white,
                                  fontSize: textFontSize,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
