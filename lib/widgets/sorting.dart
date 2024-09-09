import 'package:flutter/material.dart';

class SortingPrice extends StatefulWidget {
  final List<String> sortingOptions;
  final String selectedSorting;
  final ValueChanged<String> onSortingSelected;

  const SortingPrice({
    super.key,
    required this.sortingOptions,
    required this.selectedSorting,
    required this.onSortingSelected,
  });

  @override
  _SortingPriceState createState() => _SortingPriceState();
}

class _SortingPriceState extends State<SortingPrice> {
  late String _selectedSorting;

  @override
  void initState() {
    super.initState();
    _selectedSorting = widget.selectedSorting;
  }

  void _showBottomSheet() {
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
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            ...widget.sortingOptions.map((option) {
              bool isSelected = _selectedSorting == option;
              return ListTile(
                title: Text(option),
                trailing: isSelected
                    ? Icon(Icons.check, color: Colors.black)
                    : null,
                onTap: () {
                  setState(() {
                    _selectedSorting = option;
                  });
                  widget.onSortingSelected(_selectedSorting);
                  Navigator.pop(context);
                },
              );
            }),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showBottomSheet,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sort by: $_selectedSorting'),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
