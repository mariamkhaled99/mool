import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/widgets/category_buttons.dart';
import 'package:mool/widgets/fliter_sort.dart';
import 'package:mool/widgets/home/product_card.dart';
import 'package:mool/providers/favourite_provider.dart';

class MyListScreen extends ConsumerStatefulWidget {
  const MyListScreen({super.key});

  @override
  _MyListScreenState createState() => _MyListScreenState();
}

class _MyListScreenState extends ConsumerState<MyListScreen> {
  bool _isSearchOpen = false;
  TextEditingController _searchController = TextEditingController();
  int selectedIndex = 2;

  late List<Product> filteredProducts; // Declare filteredProducts

  @override
  void initState() {
    super.initState();
    filteredProducts = []; // Initialize to empty list
  }

  void onCategorySelected(String category) {
    setState(() {
      final allProducts = ref.read(favouriteProductsProvider);

      filteredProducts = allProducts.where((product) {
        final matchesCategory = category == "View All" || product.category == category;
        final matchesSearch = _searchController.text.isEmpty ||
            product.title.toLowerCase().contains(_searchController.text.toLowerCase());
        return matchesCategory && matchesSearch;
      }).toList();
    });
  }

  void _showSortingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Sorting',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            ListTile(
              title: const Text('Price: Low to High'),
              onTap: () {
                setState(() {
                  filteredProducts.sort((a, b) => a.price.compareTo(b.price));
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Price: High to Low'),
              onTap: () {
                setState(() {
                  filteredProducts.sort((a, b) => b.price.compareTo(a.price));
                });
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use the provider to get the list of favorite products
    final favouriteProducts = ref.watch(favouriteProductsProvider);

    // Update filtered products based on favorite products
    filteredProducts = favouriteProducts.where((product) {
      final searchQuery = _searchController.text.toLowerCase();
      return searchQuery.isEmpty ||
             product.title.toLowerCase().contains(searchQuery);
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
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
          'My List',
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
                            onChanged: (value) {
                              // Update filtered products on search
                              setState(() {
                                filteredProducts = ref.watch(favouriteProductsProvider).where((product) {
                                  return product.title.toLowerCase().contains(value.toLowerCase());
                                }).toList();
                              });
                            },
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
          CategoryButtons(onCategorySelected: onCategorySelected),
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(
                    child: Text(
                      "You don't have any favourites",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductCard(
                          product: product,
                          
                       
                        );
                      },
                    ),
                  ),
          ),
          Container(
            color: Colors.white,
            child: FliterSort(
              onSortPressed: _showSortingBottomSheet,
              onFilterPressed: () {
                // Handle filter action
              },
            ),
          ),
        ],
      ),
    );
  }
}
