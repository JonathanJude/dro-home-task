import 'package:drohealth_assessment/components/fragments/dialogs/bag_dialog.dart';
import 'package:drohealth_assessment/utils/helpers.dart';
import 'package:flutter/material.dart';

class StoreBagDialogButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final DialogType type;

  const StoreBagDialogButton(
      {Key key,
      @required this.title,
      @required this.onTap,
      @required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Align(
        alignment: Alignment.center,
        child: FlatButton(
            color: getColorFromDialogType(type),
            onPressed: onTap,
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                    minHeight: 50.0),
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}