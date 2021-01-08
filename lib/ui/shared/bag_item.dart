import 'package:drohealth_assessment/components/fragments/dialogs/bag_dialog.dart';
import 'package:drohealth_assessment/models/cart_product.dart';
import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/utils/intl_formatter.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

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
              Text(
                  DROFormatter.formatCurrencyInput(
                      widget.product.product.amount.toString()),
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontFamily: 'Roboto')),
            ],
          ),
        ),
      ),
    );
  }
}
