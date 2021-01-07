import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.name,
    this.category,
    this.grammage,
    this.images,
    this.seller,
    this.amount,
    this.constituents,
    this.inPacks,
    this.productId,
    this.units,
    this.tablets,
  });

  String name;
  String category;
  String grammage;
  List<String> images;
  String seller;
  int amount;
  String constituents;
  bool inPacks;
  String productId;
  int units;
  int tablets;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        category: json["category"],
        grammage: json["grammage"],
        images: List<String>.from(json["images"].map((x) => x)),
        seller: json["seller"],
        amount: json["amount"],
        constituents: json["constituents"],
        inPacks: json["in_packs"],
        productId: json["product_id"],
        units: json["units"],
        tablets: json["tablets"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "grammage": grammage,
        "images": List<dynamic>.from(images.map((x) => x)),
        "seller": seller,
        "amount": amount,
        "constituents": constituents,
        "in_packs": inPacks,
        "product_id": productId,
        "units": units,
        "tablets": tablets,
      };
}
