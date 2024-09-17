import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/providers/add_cart_provider.dart';
import 'package:mool/screens/payment/checkout_first.dart';
import 'package:mool/widgets/cart/cart_card.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  // Map to store quantities of products
  Map<Product, int> productQuantities = {};

  void incrementQuantity(Product product) {
    setState(() {
      productQuantities[product] = (productQuantities[product] ?? 1) + 1;
    });
  }

  // Function to decrease the quantity of a product
 void decrementQuantity(Product product) {
  setState(() {
    // Check if the product's quantity is greater than 1 before decrementing
    if (productQuantities[product] != null && productQuantities[product]! > 1) {
      productQuantities[product] = productQuantities[product]! - 1;
    }
  });
}

  // Calculate subtotal for each product
  double calculateProductTotal(Product product) {
    return product.price * (productQuantities[product] ?? 1);
  }

  // Calculate total for all products in the cart
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);

    double calculateTotal() {
      double total = 0.0;
      for (var product in cartProducts) {
        total += calculateProductTotal(product);
      }
      return double.parse(total.toStringAsFixed(2));
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              height: 120, // Reduced height
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2A2E33),
                    Color(0xFF292D32),
                  ],
                  stops: [0.4427, 1.0],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0), // Reduced padding
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120, // Adjusted position to match reduced height above
            left: 0,
            right: 0,
            child: Container(
              height: 60, // Reduced height
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Subtotal: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      calculateTotal().toString()+ ' SAR',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 180), // Ensures space for the top containers
              Expanded(
                child: cartProducts.isEmpty
                    ? const Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 11.0),
                        child: ListView.builder(
                          itemCount: cartProducts.length,
                          itemBuilder: (context, index) {
                            var product = cartProducts[index];
                            return CartCard(
                              product: product,
                              onDecrement: () => decrementQuantity(product),
                              onIncrement: () => incrementQuantity(product),
                              quantity: productQuantities[product] ?? 1,
                            );
                          },
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CheckoutFirstScreen(
                            products: cartProducts,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Proceed to Checkout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
