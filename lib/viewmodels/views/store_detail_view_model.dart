import 'package:drohealth_assessment/components/fragments/dialogs/bag_dialog.dart';
import 'package:drohealth_assessment/components/fragments/indicators/dro_loader.dart';
import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/providers/bag_provider.dart';
import 'package:drohealth_assessment/viewmodels/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoreDetailViewModel extends BaseViewModel {
  int _quantity = 1;
  int get quantity => _quantity;

  onQuantityChanged(int value){
    _quantity = value;
    notifyListeners();
  }

  onAddProductToBag(BuildContext context, Product product, [int quantity = 1]) async {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    //mock a network call
    DROLoader.show(context);
    await Future.delayed(Duration(seconds: 1));
    DROLoader.hide();

    bagProvider.addToBag(product, quantity);
    _quantity = 1;
    notifyListeners();

     showDialog(
      context: context,
      builder: (context) {
        return StoreDialogBox(
          title: 'Successful',
          desc: '${product.name} has been added to your bag',
          okTitle: 'View bag',
          cancelTitle: 'Done',
          type: DialogType.Successful,
          onOkTapped: (){
            Navigator.pop(context);
            bagProvider.detailPanelController.open();
          },
          onCancelTapped: (){
            Navigator.pop(context);
          },
        );
      });
  }

}
