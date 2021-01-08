import 'package:drohealth_assessment/components/fragments/buttons/action_button.dart';
import 'package:drohealth_assessment/components/fragments/dialogs/bag_dialog.dart';
import 'package:drohealth_assessment/components/fragments/spacers/app_sized_box.dart';
import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:drohealth_assessment/ui/base_view.dart';
import 'package:drohealth_assessment/ui/shared/product_detail_item.dart';
import 'package:drohealth_assessment/ui/shared/store_quantity_widget.dart';
import 'package:drohealth_assessment/ui/views/bag_panel.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';
import 'package:drohealth_assessment/viewmodels/views/store_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class StoreDetail extends StatefulWidget {
  final Product product;

  const StoreDetail({Key key, @required this.product}) : super(key: key);
  @override
  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final scaler = AppScaleUtil(context);

    return BaseView<StoreDetailViewModel>(
      model: StoreDetailViewModel(),
      builder: (context, model, _) => Scaffold(
        body: Consumer<BagProvider>(
          builder: (context, bagProvider, _) => Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 27),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(),
                      GestureDetector(
                        onTap: () {
                          bagProvider.detailPanelController.open();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: appPurple,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Icon(MdiIcons.purseOutline,
                                  color: Colors.white, size: 28),
                              Padding(
                                padding: scaler.insets.only(left: 3.0),
                                child: Text(bagProvider.productCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              )
                            ],
                          ),
                          padding: scaler.insets
                              .symmetric(vertical: 1, horizontal: 2),
                          margin: scaler.insets.all(2),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0),
                  Padding(
                    padding: scaler.insets.symmetric(horizontal: 3.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            widget.product.images.first,
                            height: size.height * .17,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: scaler.insets.symmetric(vertical: 0.2),
                          child: Text(widget.product.name ?? '',
                              style: TextStyle(
                                  fontSize: scaler.fontSizer.sp(40),
                                  fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: scaler.insets.symmetric(vertical: 0.5),
                          child: Text(
                              '${widget.product.category} - ${widget.product.grammage}',
                              style: TextStyle(
                                  fontSize: scaler.fontSizer.sp(32),
                                  fontWeight: FontWeight.w400)),
                        ),
                        Padding(
                          padding: scaler.insets.symmetric(vertical: 1.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/raster/logo.png'),
                                backgroundColor: Colors.grey,
                                minRadius: 28,
                              ),
                              Padding(
                                padding: scaler.insets.only(left: 3.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SOLD BY',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontSize: scaler.fontSizer.sp(26),
                                      ),
                                    ),
                                    Padding(
                                      padding: scaler.insets
                                          .symmetric(vertical: 1.0),
                                      child: Text(
                                        widget.product.seller ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: scaler.fontSizer.sp(30),
                                          color: appTurquoise,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            StoreQuantityWidget(
                              inititalValue: model.quantity,
                              onDecrement: model.onQuantityChanged,
                              onIncrement: model.onQuantityChanged,
                            ),
                            Padding(
                              padding: scaler.insets.only(left: 2.0),
                              child: Text(
                                widget.product.inPacks ? 'Pack(s)' : 'Unit(s)',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: scaler.insets.symmetric(horizontal: 1.0),
                              child: Baseline(
                                  baseline: 4,
                                  baselineType: TextBaseline.alphabetic,
                                  child: Text(
                                    '₦',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )),
                            ),
                            Text(
                              widget.product.amount.toStringAsFixed(2),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('PRODUCT DETAILS',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        SizedBox(
                          width: size.width * .8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductDetailItem(
                                  title: 'PACK SIZE',
                                  value:
                                      '${widget.product.units}X${widget.product.tablets}',
                                  icon: MdiIcons.pill),
                              ProductDetailItem(
                                  title: 'PRODUCT ID',
                                  value: widget.product.productId,
                                  icon: MdiIcons.qrcode),
                            ],
                          ),
                        ),
                        ProductDetailItem(
                          title: 'CONSTITUENTS',
                          value: widget.product.constituents,
                          icon: MdiIcons.medicalBag,
                        ),
                        ProductDetailItem(
                          title: 'DISPENSED IN',
                          value: widget.product.inPacks ? 'Packs' : 'Unit',
                          icon: MdiIcons.package
                        ),
                        Padding(
                          padding: scaler.insets
                              .symmetric(vertical: 1.0, horizontal: 3),
                          child: Center(
                              child: Text(
                                  '1 pack of ${widget.product.name} contains ${widget.product.units} unit(s) of ${widget.product.tablets} Tablet(s)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12))),
                        )
                      ],
                    ),
                  ),
                  DROSizedBox(height: 14),
                ],
              )),
              Positioned(
                bottom: 15,
                right: 0,
                left: 0,
                child: Center(
                  child: ActionButton(
                    text: 'Add to Bag',
                    icon: MdiIcons.medicalBag,
                    onPressed: () => model.onAddProductToBag(
                      context,
                      widget.product,
                      model.quantity,
                    ),
                  ),
                ),
              ),
              BagPanel(
                size: size,
                isVisible: false,
                panelController: bagProvider.detailPanelController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
