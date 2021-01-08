import 'package:drohealth_assessment/components/fragments/indicators/dro_spinner.dart';
import 'package:drohealth_assessment/components/fragments/spacers/app_sized_box.dart';
import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/ui/base_view.dart';
import 'package:drohealth_assessment/ui/shared/product_card.dart';
import 'package:drohealth_assessment/ui/shared/store_options.dart';
import 'package:drohealth_assessment/utils/dimensions.dart';
import 'package:drohealth_assessment/viewmodels/views/store_view_model.dart';
import 'package:drohealth_assessment/ui/views/bag_panel.dart';
import 'package:drohealth_assessment/ui/views/store_detail.dart';
import 'package:drohealth_assessment/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final scaler = AppScaleUtil(context);

    return BaseView<StoreViewModel>(
      model: StoreViewModel(mockData: Provider.of(context)),
      onModelReady: (model) => model.loadProducts(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DROSizedBox(height: 4),
                Padding(
                  padding: scaler.insets.symmetric(vertical: 2.0),
                  child: Text(
                    '${model.filteredProducts.length} item(s)',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StoreOptions(icon: MdiIcons.bluetoothConnect, onTap: () {}),
                    StoreOptions(icon: MdiIcons.filterOutline, onTap: () {}),
                    StoreOptions(
                      icon: Icons.search,
                      onTap: model.onSearchTapped,
                      isActive: model.showSearch,
                    ),
                  ],
                ),
                !model.showSearch
                    ? DROSizedBox()
                    : Padding(
                        padding: scaler.insets.symmetric(horizontal: 4.0, vertical: 2),
                        child: SizedBox(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white24,
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon:
                                  Icon(Icons.search, color: Colors.grey),
                              suffixIcon: GestureDetector(
                                onTap: model.onSearchTapped,
                                child: Icon(Icons.clear, color: Colors.grey)
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              hintText: 'Search',
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(30)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                  borderRadius: BorderRadius.circular(30)),
                              hintStyle: TextStyle(
                                  color: Colors.black, fontSize: 13),
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                              ),
                            ),
                            onChanged: model.onSearch,
                          ),
                        ),
                      ),
                SizedBox(height: 8),
                model.isLoading
                    ? Expanded(child: Center(child: DROSpinner()))
                    : Expanded(
                        child: Padding(
                          padding:  scaler.insets.symmetric(horizontal: 1.0),
                          child: GridView.builder(
                            itemCount: model.filteredProducts.length,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.0,
                              mainAxisSpacing: 1.0,
                              childAspectRatio: 0.8,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductCard(
                                  product: model.filteredProducts[index]);
                            },
                          ),
                        ),
                      ),
                DROSizedBox(height: 0.8),
              ],
            ),
            Consumer<BagProvider>(
              builder: (context, bagProvider, _) => BagPanel(
                size: size,
                isVisible: true,
                panelController: bagProvider.panelController,
              ),
            )
          ],
        ),
      ),
    );
  }
}

