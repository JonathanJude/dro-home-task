import 'package:drohealth_assessment/components/fragments/indicators/dro_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class DROLoader {
  static show(BuildContext context) {
    return Loader.show(context,
        progressIndicator: DROSpinner(), overlayColor: Colors.white30);
  }

  static hide() {
    return Loader.hide();
  }
}
