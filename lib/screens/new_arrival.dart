import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/screens/filters.dart';
import 'package:mool/widgets/category_buttons.dart';
import 'package:mool/widgets/fliter_sort.dart';
import 'package:mool/widgets/home/product_card.dart';
import 'package:mool/providers/favourite_provider.dart'; // Ensure you have this import

class NewArrivalScreen extends ConsumerStatefulWidget {
  final List<Product> products;

  const NewArrivalScreen({
    super.key,
    required this.products,
  });

  @override
  _NewArrivalScreenState createState() => _NewArrivalScreenState();
}

class _NewArrivalScreenState extends ConsumerState<NewArrivalScreen> {
  bool _isSearchOpen = false;
  TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = [];
  int selectedSortingIndex = 0; // Keep track of the selected sorting option

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void onCategorySelected(String category) {
    setState(() {
      if (category == "View All") {
        filteredProducts = widget.products;
      } else {
        filteredProducts = widget.products.where((product) {
          return product.category == category;
        }).toList();
      }
    });
  }

  void _applySorting() {
    setState(() {
      if (selectedSortingIndex == 0) {
        filteredProducts.sort((a, b) => a.price.compareTo(b.price)); // Low to High
      } else if (selectedSortingIndex == 1) {
        filteredProducts.sort((a, b) => b.price.compareTo(a.price)); // High to Low
      } else if (selectedSortingIndex == 2) {
        // New Arrival - Assuming `dateAdded` is a field in Product
        filteredProducts.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
      } else if (selectedSortingIndex == 3) {
        filteredProducts.sort((a, b) => b.rating.compareTo(a.rating)); // High to Low
      }
    });
  }

  void _showSortingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Sorting',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // RadioListTile for sorting options with radio buttons on the right
                  RadioListTile<int>(
                    value: 0,
                    groupValue: selectedSortingIndex,
                    title: const Text('Price: Low to High'),
                    onChanged: (int? value) {
                      setState(() {
                        selectedSortingIndex = value!;
                        _applySorting();
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing, // Move radio to the right
                    activeColor: Colors.black,
                  ),
                  RadioListTile<int>(
                    value: 1,
                    groupValue: selectedSortingIndex,
                    title: const Text('Price: High to Low'),
                    onChanged: (int? value) {
                      setState(() {
                        selectedSortingIndex = value!;
                        _applySorting();
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.black,
                  ),
                  RadioListTile<int>(
                    value: 2,
                    groupValue: selectedSortingIndex,
                    title: const Text('New Arrival'),
                    onChanged: (int? value) {
                      setState(() {
                        selectedSortingIndex = value!;
                        _applySorting();
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.black,
                  ),
                  RadioListTile<int>(
                    value: 3,
                    groupValue: selectedSortingIndex,
                    title: const Text('Rating: High to Low'),
                    onChanged: (int? value) {
                      setState(() {
                        selectedSortingIndex = value!;
                        _applySorting();
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final favouriteProducts = ref.watch(favouriteProductsProvider);

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
          'New Arrival',
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
          CategoryButtons(onCategorySelected: onCategorySelected),
          Expanded(
            child: Padding(
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
            child: FliterSort(
              onSortPressed: _showSortingBottomSheet,
              onFilterPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FiltersScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
