import 'package:drohealth_assessment/components/fragments/dialogs/bag_dialog.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:flutter/material.dart';

Color getColorFromDialogType(DialogType type){
  switch (type) {
    case DialogType.Successful:
      return appTurquoise;
      break;
    case DialogType.Info:
      return Colors.indigo;
      break;
    case DialogType.Error:
      return Colors.red;
      break;
    default:
      return Colors.indigo;
  }
}

IconData getIconFromDialogType(DialogType type){
  switch (type) {
    case DialogType.Successful:
      return Icons.check_circle;
      break;
    case DialogType.Info:
      return Icons.info;
      break;
    case DialogType.Error:
      return Icons.error;
      break;
    default:
      return Icons.info;
  }
}
