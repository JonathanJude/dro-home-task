import 'package:drohealth_assessment/components/fragments/dialogs/bag_dialog.dart';
import 'package:drohealth_assessment/models/cart_product.dart';
import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
        // controller: bagProvider.panelController,
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

class BagItem extends StatefulWidget {
  final CartProduct product;

  const BagItem({Key key, @required this.product}) : super(key: key);
  @override
  _BagItemState createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {
  Widget _quantityButton(bool isAdd, Product product) {
    return Container(
      height: 45,
      width: 32,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          isAdd ? Icons.add : Icons.remove,
          color: Colors.grey,
        ),
        onPressed: () {
          BagProvider bagProvider = Provider.of<BagProvider>(context);
          if (isAdd) {
            bagProvider.incrementItem(product.productId);
          } else {
            bagProvider.decrementItem(product.productId);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BagProvider>(
      builder: (context, bagProvider, _) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0),
        child: ExpansionTile(
          trailing: SizedBox(width: 0),
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: (val) {
            print(val);
          },
          children: [
            SizedBox(height: 4),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StoreDialogBox(
                              desc:
                                  'You are about to remove ${widget.product.product.name}from your cart? \n Click OK to proceed',
                              okTitle: 'OK',
                              cancelTitle: 'Cancel',
                              type: DialogType.Info,
                              onOkTapped: () {
                                Navigator.pop(context);
                                bagProvider.removeFromBag(
                                    widget.product.product.productId);
                              },
                              onCancelTapped: () {
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                    child: Icon(MdiIcons.trashCanOutline, color: Colors.white)),
                Spacer(),
                _quantityButton(false, widget.product.product),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(widget.product.quantity.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                _quantityButton(true, widget.product.product),
              ],
            )
          ],
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage(widget.product.product.images.first),
                minRadius: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Text('${widget.product.quantity}X',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.product.name,
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(widget.product.product.category,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              Text('N${widget.product.product.amount}',
                  style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

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
        Icon(MdiIcons.cartOutline, color: Colors.white),
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
      builder: (context, bagProvider, _) => Container(
        height: size.height,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
            color: appPurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          // controller: scrollController,
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
    );
  }
}
