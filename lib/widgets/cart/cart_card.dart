import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/providers/add_cart_provider.dart';

class CartCard extends ConsumerWidget {
  final Product product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartCard({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0, // Remove shadow
            child: SizedBox(
              height: 150, // Match the image height
              child: Row(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.horizontal(left: Radius.circular(12.0)),
                    child: Image.asset(
                      product.imagePath,
                      height: 250, // Match the card height
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Product Details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Product Title
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Product Price
                          Text(
                            '${product.price} SAR',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          
                          // Sold By Information
                          Row(
                            children: [
                              const Text(
                                'Sold by: ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),const Text(
                                'Zara ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 9, 178, 197),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Quantity Controls with smaller border and rounded corners
          Positioned(
            right: 120, // Adjust position
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey.shade300, // Border for the entire section
                ),
              ),
              child: Row(
                children: [
                  // Decrement Button
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: Colors.grey, // Smaller border around the icon
                        width: 1.0, // Smaller border width
                      ),
                    ),
                    child: IconButton(
                      onPressed: onDecrement,
                      icon: const Icon(Icons.remove),
                      color: Colors.black,
                      iconSize: 14, // Reduced icon size
                    ),
                  ),
                  const SizedBox(width: 8), // Space between buttons
                  // Quantity Display
                  Text(
                    quantity.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8), // Space between buttons
                  // Increment Button
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: Colors.grey, // Smaller border around the icon
                        width: 1.0, // Smaller border width
                      ),
                    ),
                    child: IconButton(
                      onPressed: onIncrement,
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                      iconSize: 14, // Reduced icon size
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Delete icon
          Positioned(
            right: -5,
            bottom: -5,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0), // Space between quantity controls and delete icon
              child: GestureDetector(
                onTap: () {
                  cartNotifier.removeProductFromCart(product);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
