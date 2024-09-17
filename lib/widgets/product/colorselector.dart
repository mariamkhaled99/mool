import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  Color selectedColor = Colors.black;

  final List<ColorOption> colors = [
    ColorOption(color: Colors.black, isAvailable: true),
    ColorOption(color: Colors.white, isAvailable: true),
    ColorOption(color: Colors.brown, isAvailable: true),
    ColorOption(color: Color(0xFFF5F5DC), isAvailable: true), // Beige
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Align buttons in the center
      children: colors.map((colorOption) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add smaller horizontal padding
          child: ColorButton(
            colorOption: colorOption,
            isSelected: selectedColor == colorOption.color,
            onSelected: (color) {
              if (colorOption.isAvailable) {
                setState(() {
                  selectedColor = color;
                });
              }
            },
          ),
        );
      }).toList(),
    );
  }
}

class ColorOption {
  final Color color;
  final bool isAvailable;

  ColorOption({required this.color, required this.isAvailable});
}

class ColorButton extends StatelessWidget {
  final ColorOption colorOption;
  final bool isSelected;
  final Function(Color) onSelected;

  const ColorButton({
    Key? key,
    required this.colorOption,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: colorOption.isAvailable ? () => onSelected(colorOption.color) : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorOption.color, // Set the button background to the color
        minimumSize: Size(50, 50), // Button size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        side: isSelected ? BorderSide(color: const Color.fromARGB(255, 107, 192, 232), width: 2) : null, // Blue border if selected
      ),
      child: SizedBox.shrink(), // No text, we just display the color
    );
  }
}
