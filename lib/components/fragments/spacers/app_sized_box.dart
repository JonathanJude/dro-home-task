import 'package:flutter/widgets.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';

class DROSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const DROSizedBox({this.height = 0, this.width = 0, this.child});

  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return SizedBox(
      height: scaler.sizer.setHeight(height),
      width: scaler.sizer.setWidth(width),
      child: child,
    );
  }
}
