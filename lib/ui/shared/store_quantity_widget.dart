import 'package:drohealth_assessment/utils/dimensions.dart';
import 'package:flutter/material.dart';

class StoreQuantityWidget extends StatefulWidget {
  final Function(int) onDecrement;
  final Function(int) onIncrement;
  final int inititalValue;

  const StoreQuantityWidget(
      {Key key,
      @required this.onDecrement,
      @required this.onIncrement,
      this.inititalValue = 1})
      : super(key: key);

  @override
  _StoreQuantityWidgetState createState() => _StoreQuantityWidgetState();
}

class _StoreQuantityWidgetState extends State<StoreQuantityWidget> {
  int value;

  @override
  void initState() {
    super.initState();
    value = widget.inititalValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final scaler = AppScaleUtil(context);

    return Container(
      width: size.width * .24,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (value > 1) {
                setState(() {
                  value -= 1;
                });
                widget.onDecrement(value);
              }
            },
            child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: scaler.insets.symmetric(horizontal: 1.0),
              child: Text('-', style: TextStyle(fontSize: 30)),
            ),
          ),
          Padding(
            // padding: EdgeInsets.symmetric(horizontal: 0.0),
            padding: scaler.insets.symmetric(horizontal: 0.0),
            child: Text(' $value ', style: TextStyle(fontSize: 20)),
          ),
          GestureDetector(
            onTap: () {
              if (value >= 1) {
                setState(() {
                  value += 1;
                });
                widget.onIncrement(value);
              }
            },
            child: Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 5.0),
              padding: scaler.insets.symmetric(horizontal: 1.0),
              child: Text('+', style: TextStyle(fontSize: 28)),
            ),
          ),
        ],
      ),
      // padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      padding: scaler.insets.symmetric(horizontal: 1.3, vertical: 0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
