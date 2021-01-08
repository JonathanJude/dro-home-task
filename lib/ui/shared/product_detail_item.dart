import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ProductDetailItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ProductDetailItem(
      {Key key,
      @required this.title,
      @required this.value,
      @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final scaler = AppScaleUtil(context);
    return Padding(
      padding: scaler.insets.symmetric(vertical: 0.8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 26, color: appPurple),
          Padding(
            padding: scaler.insets.symmetric(horizontal: 1.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: scaler.insets.symmetric(vertical: 0.2),
                  child: Text(
                    value,
                    style: TextStyle(
                      color: appTurquoise,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
