import 'package:drohealth_assessment/models/product.dart';

class MockData {
  var productsJson = [
  {
    "name": "Nivea Nourishing Cocoa Body Lotion",
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
    "name": "Dettol Antiseptic Liquid",
    "category":  "Antiseptic",
    "grammage": "100ml",
    "images": [
      "assets/images/raster/products/dettol_antiseptic_liquid.jpg",
    ],
    "seller": "Dettol",
    "amount": 1300,
    "constituents": "Antibacterial",
    "in_packs":  true,
    "product_id": "DETTLANTI",
    "units": 3,
    "tablets": 10
  },
  {
    "name": "Dettol Hand Sanitizer",
    "category":  "Hand Sanitizers",
    "grammage": "50ml",
    "images": [
      "assets/images/raster/products/dettol_hand_sanitizer.jpg",
    ],
    "seller": "Dettol",
    "amount": 750,
    "constituents": "Antibacterial",
    "in_packs":  true,
    "product_id": "DETTLHAND",
    "units": 3,
    "tablets": 10
  },
  {
    "name": "Andrea Fastest Hair & Beard Growth Essence",
    "category":  "Hair & Scalp Care",
    "grammage": "20ml",
    "images": [
      "assets/images/raster/products/andrea_hair.jpg",
    ],
    "seller": "Andrea",
    "amount": 400,
    "constituents": "Hair Care",
    "in_packs":  true,
    "product_id": "Andrea",
    "units": 3,
    "tablets": 10
  },
  {
    "name": "KN95 Face Mask",
    "category":  "Face Mask",
    "grammage": "",
    "images": [
      "assets/images/raster/products/kn95_face_mask.jpg",
    ],
    "seller": "Emzor Pharmaceuticals",
    "amount": 400,
    "constituents": "Antibacterial",
    "in_packs":  true,
    "product_id": "KN95",
    "units": 3,
    "tablets": 10
  },
  {
    "name": "OCare Face Mask",
    "category":  "Face Mask",
    "grammage": "",
    "images": [
      "assets/images/raster/products/ocare_face_mask.jpg",
    ],
    "seller": "Emzor Pharmaceuticals",
    "amount": 400,
    "constituents": "Antibacterial",
    "in_packs":  true,
    "product_id": "Ocare",
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