import 'package:flutter/material.dart';
import 'package:mool/models/products.dart';
import 'package:mool/widgets/home/product_card.dart';

class ProductScroller extends StatefulWidget {
  const ProductScroller({super.key, required List<Product> products});

  @override
  _ProductScrollerState createState() => _ProductScrollerState();
}

class _ProductScrollerState extends State<ProductScroller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductCard(
            product: product,
            onFavoriteTap: () {
              setState(() {
                // Handle favorite icon tap (toggle logic here)
              });
            },
            onAddTap: () {
              // Handle add icon tap
            },
          );
        },
      ),
    );
  }
}
