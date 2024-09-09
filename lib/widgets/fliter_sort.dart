import 'package:flutter/material.dart';

class FliterSort extends StatelessWidget {
  final VoidCallback onSortPressed;
  final VoidCallback onFilterPressed;

  const FliterSort({
    super.key,
    required this.onSortPressed,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onSortPressed,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/sort.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text('SORT', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 40,
          width: 1,
          color: Colors.black,
        ),
        Expanded(
          child: GestureDetector(
            onTap: onFilterPressed,
            child: Container(
              height: 40,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/filter-search.png',
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 8),
                  const Text('FILTER', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
