import 'package:drohealth_assessment/models/product.dart';
import 'package:drohealth_assessment/ui/views/store_detail.dart';
import 'package:drohealth_assessment/utils/intl_formatter.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.white,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StoreDetail(
                    product: product,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF0c3962).withOpacity(.12),
              blurRadius: 12,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: Center(
                      child: Image.asset(
                    product.images.first,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(product.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(product.constituents,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Text('${product.category} - ${product.grammage}',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 1.4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                        DROFormatter.formatCurrencyInput(
                            product.amount.toStringAsFixed(2)),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Roboto')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
