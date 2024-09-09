import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/widgets/home/product_card.dart';
import 'package:mool/providers/favourite_provider.dart';

class ProductScroller extends ConsumerWidget {
  final List<Product> products;

  const ProductScroller({super.key, required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the list of favorite products from the provider
    final favouriteProducts = ref.watch(favouriteProductsProvider);

    return Container(
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductCard(
            product: product,
            onAddTap: () {
              // Handle add to cart tap
            },
            // onFavoriteTap: () {
            //   // Toggle favorite status through the provider
            //   ref.read(favouriteProductsProvider.notifier).toggleFavorite(product);
            // },
            // isFavorite: favouriteProducts.contains(product), 
          );
        },
      ),
    );
  }
}
