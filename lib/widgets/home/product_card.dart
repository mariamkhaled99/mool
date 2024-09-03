import 'package:flutter/material.dart';
import 'package:mool/models/products.dart';
import 'package:mool/screens/product/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddTap;

  const ProductCard({
    Key? key,
    required this.product,
    required this.onFavoriteTap,
    required this.onAddTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image Section
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                    child: Image.asset(
                      product.imagePath,
                      height: 185.0,
                      width: 160.0,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Title and Price Section
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${product.price} SAR',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Favorite Icon on Top Right
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: 24.0,
                    ),
                  ),
                ),
              ),

              // Add Button at Bottom Right Corner, clipped
              Positioned(
                bottom: -3,
                right: -3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(17.0),
                  ),
                  child: GestureDetector(
                    onTap: onAddTap,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
