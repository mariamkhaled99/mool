import 'package:flutter/material.dart';
import 'package:mool/models/category.dart';

class CategoryScroller extends StatelessWidget {
  const CategoryScroller({super.key});

@override
Widget build(BuildContext context) {
  return Container(
   color: const Color.fromARGB(255, 241, 237, 237),
    child: Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 120.0, // Set a fixed height for the ListView
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          category.imagePath,
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
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
        title: const Text('Category Details', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(category.imagePath),
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
