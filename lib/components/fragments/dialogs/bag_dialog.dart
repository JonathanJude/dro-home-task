import 'dart:ui';
import 'package:drohealth_assessment/components/fragments/buttons/store_bag_dialog_button.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

enum DialogType { Successful, Info, Error }

class StoreDialogBox extends StatefulWidget {
  final String title;
  final String desc;
  final String okTitle;
  final String cancelTitle;
  final DialogType type;
  final Function onOkTapped;
  final Function onCancelTapped;

  const StoreDialogBox(
      {Key key,
      this.title,
      @required this.desc,
      this.okTitle = "OK",
      this.cancelTitle = "Cancel",
      this.type = DialogType.Info,
      @required this.onOkTapped,
      @required this.onCancelTapped})
      : super(key: key);

  @override
  _StoreDialogBoxState createState() => _StoreDialogBoxState();
}

class _StoreDialogBoxState extends State<StoreDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Consumer<BagProvider>(
      builder: (context, bagProvider, _) => Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: Constants.padding,
                top: Constants.avatarRadius + Constants.padding,
                right: Constants.padding,
                bottom: Constants.padding),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                widget.title == null ? SizedBox() : Text(widget.title ?? '',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.desc ?? '',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                StoreBagDialogButton(
                  title: widget.okTitle ?? '',
                  onTap: widget.onOkTapped,
                  type: widget.type,
                ),
                StoreBagDialogButton(
                  title: widget.cancelTitle ?? '',
                  onTap: widget.onCancelTapped,
                  type: widget.type,
                ),
              ],
            ),
          ),
          Positioned(
            left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                  child: Container(
                      color: Colors.white,
                      child: Icon(getIconFromDialogType(widget.type),
                          color: getColorFromDialogType(widget.type),
                          size: 80))),
            ),
          ),
        ],
      ),
    );
  }
}


