import 'package:drohealth_assessment/components/fragments/buttons/action_button.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/ui/shared/bag_item.dart';
import 'package:drohealth_assessment/ui/views/bag_panel.dart';
import 'package:drohealth_assessment/utils/intl_formatter.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CartWidget extends StatefulWidget {
  final PanelController controller;

  const CartWidget({
    Key key,
    @required this.controller,
  }) : super(key: key);
  @override
  _CartWidgetState createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {

  Widget _bagWidget() {
    return Row(
      children: [
        Icon(MdiIcons.purseOutline, color: Colors.white),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text('Bag', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  _togglePanel() {
    PanelController controller = widget.controller;
    controller.isPanelOpen ? controller.close() : controller.open();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<BagProvider>(
      builder: (context, bagProvider, _) => Stack(
        children: [
          Container(
            height: size.height,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            decoration: BoxDecoration(
                color: appPurple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: _togglePanel,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 5,
                          width: 75,
                          padding: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (widget.controller.isPanelOpen)
                              Flexible(
                                  child: Container(
                                child: Icon(Icons.clear, color: Colors.white),
                                padding: EdgeInsets.symmetric(horizontal: 0),
                              )),
                            _bagWidget(),
                            if (!widget.controller.isPanelOpen)
                              Expanded(
                                  child: Container(
                                child: Text(''),
                                padding: EdgeInsets.symmetric(horizontal: 23),
                              )),
                            Flexible(
                                child:
                                    BagCountWidget(count: bagProvider.productCount))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 13),
                    margin: EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Tap on an item to add, remove, delete options',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),
                  bagProvider.productCount == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Icon(MdiIcons.cartOff, color: Colors.white, size: 45),
                            SizedBox(height: 10),
                            Text('You have no item in your Bag',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 15)),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: bagProvider.productsInBag
                              .map((product) => BagItem(
                                    product: product,
                                  ))
                              .toList()),
                ],
              ),
            ),
          ),

          

          Positioned(
            bottom: 12,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0, right: 20, left: 20),
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(color:Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Text(DROFormatter.formatCurrencyInput(bagProvider.getTotalAmount().toString()), style: TextStyle(color:Colors.white, fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
                ),
                ActionButton(
                  text: 'Checkout', 
                  onPressed: (){},
                  borderRadius: 30,
                  height: 45,
                  textFontSize: 16,
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
