import 'package:flutter/material.dart';
import 'package:mool/models/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3, // Repeat three times
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      product.imagePath,
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Text(
                  //   product.title,
                  //   style: const TextStyle(
                  //     fontSize: 22.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
