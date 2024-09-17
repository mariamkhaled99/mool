import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = 'M';

  final List<SizeOption> sizes = [
    SizeOption(size: 'XS', isAvailable: true),
    SizeOption(size: 'S', isAvailable: false),
    SizeOption(size: 'M', isAvailable: true),
    SizeOption(size: 'L', isAvailable: true),
    // SizeOption(size: 'XL', isAvailable: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Align buttons in the center
      children: sizes.map((sizeOption) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add smaller horizontal padding
          child: SizeButton(
            sizeOption: sizeOption,
            isSelected: selectedSize == sizeOption.size,
            onSelected: (size) {
              if (sizeOption.isAvailable) {
                setState(() {
                  selectedSize = size;
                });
              }
            },
          ),
        );
      }).toList(),
    );
  }
}

class SizeOption {
  final String size;
  final bool isAvailable;

  SizeOption({required this.size, required this.isAvailable});
}

class SizeButton extends StatelessWidget {
  final SizeOption sizeOption;
  final bool isSelected;
  final Function(String) onSelected;

  const SizeButton({
    Key? key,
    required this.sizeOption,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: sizeOption.isAvailable ? () => onSelected(sizeOption.size) : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        minimumSize: Size(50, 50), // Set your desired button size here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: sizeOption.isAvailable ? BorderSide(color: Colors.black) : null,
      ),
      child: Text(sizeOption.size),
    );
  }
}
