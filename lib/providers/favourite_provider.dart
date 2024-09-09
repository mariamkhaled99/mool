import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';

// The FavouriteProductsNotifier is a custom StateNotifier responsible for managing
// a list of favorite products

class FavouriteProductsNotifier extends StateNotifier<List<Product>> {
  // Constructor initializes the notifier with an empty list of products.
  FavouriteProductsNotifier() : super([]);

  // The toggleFavorite method is used to add or remove a product from the list of favorites.
  // If the product is already in the list, it is removed; otherwise, it is added.
  void toggleFavorite(Product product) {
    if (state.contains(product)) {
      // If the product is already in the favorites list, remove it.
      state = state.where((p) => p != product).toList();
    } else {
      // If the product is not in the favorites list, add it.
      state = [...state, product];
    }
  }

  // The isFavorite method checks if a product is in the list of favorites.
  // It returns true if the product is in the list, otherwise false.
  bool isFavorite(Product product) {
    return state.contains(product);
  }
}


// The provider allows other widgets and components to access and interact with the notifier's state.
final favouriteProductsProvider =
    StateNotifierProvider<FavouriteProductsNotifier, List<Product>>((ref) {
  return FavouriteProductsNotifier();
});



