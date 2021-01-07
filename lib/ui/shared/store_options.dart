import 'package:drohealth_assessment/styles/colors.dart';
import 'package:flutter/material.dart';

class StoreOptions extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final bool isActive;
  const StoreOptions({
    Key key,
    @required this.icon,
    @required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  isActive ? appGray.withOpacity(.7) : appGray.withOpacity(.1)),
          child: Icon(icon, size: 22, color: Colors.black54)),
    );
  }
}