import 'package:drohealth_assessment/models/product.dart';

class CartProduct {
  Product product;
  int quantity;

  CartProduct({
    this.product, this.quantity = 0
  });
}