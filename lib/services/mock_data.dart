import 'package:drohealth_assessment/models/product.dart';

class MockData {
  var productsJson = [
  {
    "name": "Nivea Nourishing Cocoa Body Lotion For Women - 400ml",
    "category":  "Skin Care",
    "grammage": "400ml",
    "images": [
      "assets/images/raster/products/nivea_400ml.jpg",
    ],
    "seller": "Nivea",
    "amount": 3400,
    "constituents": "Body Oil",
    "in_packs":  true,
    "product_id": "PROBRYVPW1",
    "units": 3,
    "tablets": 0
  },
  {
    "name": "Garlic Oil",
    "category":  "Soft Gel",
    "grammage": "650mg",
    "images": [
      "assets/images/raster/products/dettol_antiseptic_liquid.jpg",
      "assets/images/raster/products/kn95_face_mask.jpg",
      "assets/images/raster/products/ocare_face_mask.jpg",
    ],
    "seller": "Emzor Pharmaceuticals",
    "amount": 385,
    "constituents": "Garlic Oil",
    "in_packs":  true,
    "product_id": "PROBRYVW1",
    "units": 3,
    "tablets": 10
  },
];


  Future<List<Product>> getProducts() async {
    List<Product> products;
    await Future.delayed(Duration(seconds: 3));

    var items;
    items = productsJson.cast<Map<String, dynamic>>();
    products = items.map<Product>((json) {
      return Product.fromJson(json);
    }).toList();

    return products;
  }
}