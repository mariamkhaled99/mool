import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String _selectedValue;
  late List<String> _items;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue ?? '';
    _items = widget.items;
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Select a country',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                ..._items.map((item) {
                  bool isSelected = _selectedValue == item;
                  return ListTile(
                    leading: CountryFlag.fromCountryCode(
                      getCountryCode(item),
                      width: 32,
                      height: 28,
                    ),
                    title: Text(item),
                    trailing: isSelected
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.check,
                            ),
                          ),
                    onTap: () {
                      setState(() {
                        _selectedValue = item;
                        widget.onChanged(_selectedValue);
                      });
                    },
                  );
                }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the bottom sheet
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: _showBottomSheet,
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0xFFF5F5F5), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0x00f5f5f5), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Color(0x00f5f5f5), width: 2),
            ),
            labelStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          child: Row(
            children: [
              if (_selectedValue.isNotEmpty)
                Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      getCountryCode(_selectedValue),
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(_selectedValue),
                  ],
                )
              else
                const Text(
                  'Country',
                  style: TextStyle(color: Colors.grey),
                ),
              const Spacer(),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  String getCountryCode(String countryName) {
    switch (countryName) {
      case 'United Arab Emirates':
        return 'ae';
      case 'Saudi Arabia':
        return 'sa';
      case 'Egypt':
        return 'eg';
      default:
        return 'eg';
    }
  }
}
