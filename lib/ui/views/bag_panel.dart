import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/ui/shared/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BagPanel extends StatefulWidget {
  final Size size;
  final bool isVisible;
  final PanelController panelController;

  const BagPanel(
      {Key key,
      @required this.size,
      this.isVisible = true,
      @required this.panelController})
      : super(key: key);
  @override
  _BagPanelState createState() => _BagPanelState();
}

class _BagPanelState extends State<BagPanel> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<BagProvider>(
      builder: (context, bagProvider, _) => SlidingUpPanel(
        controller: widget.panelController,
        maxHeight: widget.size.height * .96,
        minHeight: widget.isVisible ? widget.size.height * 0.08 : 0.0,
        onPanelOpened: () {
          setState(() {
            _isOpen = true;
          });
        },
        onPanelClosed: () {
          setState(() {
            _isOpen = false;
          });
        },
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        isDraggable: true,
        panel: Consumer<BagProvider>(
          builder: (context, bagProvider, _) => CartWidget(
            controller: widget.panelController,
          ),
        ),
      ),
    );
  }
}

class BagCountWidget extends StatefulWidget {
  final int count;

  const BagCountWidget({Key key, @required this.count}) : super(key: key);
  @override
  _BagCountWidgetState createState() => _BagCountWidgetState();
}

class _BagCountWidgetState extends State<BagCountWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Text(widget.count.toString(),
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}


