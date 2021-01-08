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
      width: size.width * .26,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () {
                if (value > 1) {
                  setState(() {
                    value -= 1;
                  });
                  widget.onDecrement(value);
                }
              },
              child: Padding(
                padding: scaler.insets.symmetric(horizontal: 1.0),
                child: Icon(Icons.remove, size: 25),
              ),
            ),
          ),
          Padding(
            padding: scaler.insets.symmetric(horizontal: 0.0),
            child: Text(' $value ', style: TextStyle(fontSize: 20)),
          ),
          Flexible(
            child: GestureDetector(
              onTap: () {
                if (value >= 1) {
                  setState(() {
                    value += 1;
                  });
                  widget.onIncrement(value);
                }
              },
              child: Padding(
                padding: scaler.insets.symmetric(horizontal: 2.0),
                child: Icon(Icons.add, size: 25),
              ),
            ),
          ),
        ],
      ),
      padding: scaler.insets.symmetric(horizontal: 1.3, vertical: 0.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
