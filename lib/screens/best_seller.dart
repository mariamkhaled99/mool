import 'package:flutter/material.dart';
import 'package:mool/models/products.dart';
import 'package:mool/screens/product/product_card.dart';
import 'package:mool/widgets/fliter_sort.dart';
import 'package:mool/widgets/home/product_card.dart'; // Ensure you have this import

class BestSellerScreen extends StatefulWidget {
  final List<Product> products;

  const BestSellerScreen({
    super.key,
    required this.products,
  });

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  bool _isSearchOpen = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Best Sellers',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  right: 0,
                  child: Row(
                    children: [
                      if (_isSearchOpen)
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      IconButton(
                        icon: Icon(
                          _isSearchOpen ? Icons.close : Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearchOpen = !_isSearchOpen;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7, 
                ),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  return ProductCard(
                    product: product,
                    onFavoriteTap: () {
                      // Handle favorite tap
                    },
                    onAddTap: () {
                      // Handle add to cart tap
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: FliterSort(), 
          ),
        ],
      ),
    );
  }
}
