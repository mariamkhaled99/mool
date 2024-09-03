import 'package:flutter/material.dart';
import 'package:mool/models/category.dart';
import '../widgets/home/navbar.dart'; // Import the CustomNavbar

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 237, 237),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Categories', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20), // Padding above the grid
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding on left and right
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 16.0), // Padding above the grid
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 columns
                      mainAxisSpacing: 16.0, // Vertical spacing between cards
                      crossAxisSpacing: 16.0, // Horizontal spacing between cards
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryDetailScreen(categoryIndex: category.index),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                category.imagePath,
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 0, // Position text at the bottom
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  color: const Color.fromARGB(255, 255, 255, 255)
                                      .withOpacity(0.5),
                                  child: Center(
                                    child: Text(
                                      category.title,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child:  CustomNavbar(selectedIndex:1), // Add CustomNavbar here
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final int categoryIndex;

  const CategoryDetailScreen({Key? key, required this.categoryIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = categories.firstWhere((cat) => cat.index == categoryIndex);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('All', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'Details for ${category.title}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
