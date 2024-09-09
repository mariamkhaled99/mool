import 'package:flutter/material.dart';
import 'package:mool/models/category.dart';

class CategoryButtons extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryButtons({
    super.key,
    required this.onCategorySelected,
  });

  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 60.0, // Set a fixed height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = _selectedIndex == index;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                      widget.onCategorySelected(category.title);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                      backgroundColor: isSelected ? Colors.black : Colors.white,
                      side: BorderSide(
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: isSelected ? 5 : 0,
                    ),
                    child: Text(
                      category.title,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
