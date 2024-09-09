import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  // Constructor initializes the notifier with an empty cart.
  CartNotifier() : super([]);

  // Method to add a product to the cart.
  void addProductToCart(Product product) {
    // If the product is already in the cart, do not add it again.
    if (!state.contains(product)) {
      state = [...state, product];
    }
  }

  // Method to remove a product from the cart.
  void removeProductFromCart(Product product) {
    // Remove the product from the cart if it exists.
    state = state.where((p) => p != product).toList();
  }

  // Method to check if a product is in the cart.
  bool isInCart(Product product) {
    return state.contains(product);
  }

  //  Clear all products from the cart.
  void clearCart() {
    state = [];
  }

  //  Get the total count of items in the cart.
  int cartItemCount() {
    return state.length;
  }

  //  Get the total price of all items in the cart.
  double totalPrice() {
    return state.fold(0.0, (total, product) => total + product.price);
  }
}
