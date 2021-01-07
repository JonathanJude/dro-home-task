import 'package:drohealth_assessment/models/cart_product.dart';
import 'package:drohealth_assessment/models/product.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class BagProvider extends ChangeNotifier {
  List<CartProduct> _productsInBag = [];
  PanelController _panelController = PanelController();
  PanelController _detailPanelController = PanelController();

  List<CartProduct> get productsInBag => _productsInBag;
  PanelController get panelController => _panelController;
  PanelController get detailPanelController => _detailPanelController;
  int get productCount => _productsInBag.length;

  addToBag(Product product, [int quantity = 1]) {
    var check = _productsInBag.firstWhere(
        (inBag) => product.productId == inBag.product.productId,
        orElse: () => null);
    if (check != null) {
      int index = _productsInBag.indexOf(check);
      check.quantity += quantity;
      _productsInBag.replaceRange(index, index + 1, [check]);
    } else {
      CartProduct cartProduct =
          CartProduct(product: product, quantity: quantity);
      _productsInBag.add(cartProduct);
    }

    notifyListeners();
  }

  removeFromBag(String productId) {
    _productsInBag.removeWhere((prod) => prod.product.productId == productId);
    notifyListeners();
  }

  incrementItem(String productId) {
    var check = _productsInBag.firstWhere(
        (inBag) => productId == inBag.product.productId,
        orElse: () => null);
    if (check != null) {
      int index = _productsInBag.indexOf(check);
      check.quantity += 1;
      _productsInBag.replaceRange(index, index + 1, [check]);
    }

    notifyListeners();
  }

  decrementItem(String productId) {
    var check = _productsInBag.firstWhere(
        (inBag) => productId == inBag.product.productId && inBag.quantity > 1,
        orElse: () => null);
    if (check != null) {
      int index = _productsInBag.indexOf(check);
      check.quantity -= 1;
      _productsInBag.replaceRange(index, index + 1, [check]);
    }

    notifyListeners();
  }

  int getTotalAmount() {
    int total = 0;
    _productsInBag.forEach((product) {
      total += product.product.amount * product.quantity;
    });

    return total;
  }
}
