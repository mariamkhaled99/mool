import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mool/models/products.dart';
import 'package:mool/utils/form_utils.dart';
import 'package:mool/widgets/auth/select_country.dart';

class ShippingScreen extends StatefulWidget {
  final List<Product> products;

  const ShippingScreen({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  _ShippingScreenState createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool _isEditing = false;
  bool _isAdding = false;
  int? _editingIndex; // Index of the address being edited
  List<Map<String, dynamic>> _addresses = [
    {
      'name': 'Ahmed Sad eldin',
      'street': '123 Elm Street',
      'buildingNo': '4B',
      'city': 'Cairo',
      'landmark': 'tree',
      'code': '002',
      'phone': '01011111111',
      'country': 'Egypt' // Add country field
    }
  ];

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _street = '';
  String _buildingNo = '';
  String _city = '';
  String _landmark = '';
  String _code = '';
  String _phone = '';
  String? _selectedCountry;

  final List<String> _countries = ['Saudi Arabia', 'Egypt', 'United Arab Emirates'];

  void _toggleEdit(int index) {
    setState(() {
      _isEditing = true;
      _isAdding = false;
      _editingIndex = index;
      // Safely assign values or default to an empty string
      _name = _addresses[index]['name'] ?? '';
      _street = _addresses[index]['street'] ?? '';
      _buildingNo = _addresses[index]['buildingNo'] ?? '';
      _city = _addresses[index]['city'] ?? '';
      _landmark = _addresses[index]['landmark'] ?? ''; // Corrected the key here
      _code = _addresses[index]['code'] ?? ''; // Corrected the key here
      _phone = _addresses[index]['phone'] ?? ''; // Corrected the key here
      _selectedCountry = _addresses[index]['country'] ?? ''; // Corrected the key here
    });
  }

  void _toggleAdd() {
    setState(() {
      _isAdding = !_isAdding;
      _isEditing = false;
      _editingIndex = null;
      _name = '';
      _street = '';
      _buildingNo = '';
      _city = '';
      _landmark = '';
      _code = '';
      _phone = '';
      _selectedCountry = null;
    });
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (_isAdding) {
        setState(() {
          _addresses.add({
            'name': _name,
            'street': _street,
            'buildingNo': _buildingNo,
            'city': _city,
            'landmark': _landmark,
            'code': _code,
            'phone': _phone,
            'country': _selectedCountry, // Save selected country
          });
          _isAdding = false;
        });
      } else if (_isEditing && _editingIndex != null) {
        setState(() {
          _addresses[_editingIndex!] = {
            'name': _name,
            'street': _street,
            'buildingNo': _buildingNo,
            'city': _city,
            'landmark': _landmark,
            'code': _code,
            'phone': _phone,
            'country': _selectedCountry, // Save selected country
          };
          _isEditing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 232, 232, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Your Shipping Address',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: _isEditing || _isAdding
                    ? Container(
                        color: Colors.transparent,
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomDropdown(
                                items: _countries,
                                selectedValue: _selectedCountry,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedCountry = value;
                                  });
                                },
                              ),
                              _buildFormField(
                                  'Name', _name, (value) => _name = value!),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: _buildFormField('Code', _code,
                                        (value) => _code = value!),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: _buildFormField('Phone', _phone,
                                        (value) => _phone = value!),
                                  ),
                                ],
                              ),
                              _buildFormField('Street', _street,
                                  (value) => _street = value!),
                              _buildFormField('Building No.', _buildingNo,
                                  (value) => _buildingNo = value!),
                              _buildFormField(
                                  'City', _city, (value) => _city = value!),
                              _buildFormField('Nearest Landmark', _landmark,
                                  (value) => _landmark = value!),
                              const SizedBox(height: 16.0),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: _saveChanges,
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.black,
                                  ),
                                  child: Text(_isAdding
                                      ? 'Add Address'
                                      : 'Save Changes'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          ..._addresses.asMap().entries.map((entry) {
                            int index = entry.key;
                            Map<String, dynamic> address = entry.value;
                            return Container(
                              margin: const EdgeInsets.only(bottom: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Shipping Address',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          InkWell(
                                            onTap: () => _toggleEdit(index),
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  color: Color(0xFF33CCCC)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    _buildReadOnlyField(
                                        'Name', address['name']),
                                    _buildReadOnlyField(
                                        'Street', address['street']),
                                    _buildReadOnlyField(
                                        'Building No.', address['buildingNo']),
                                    _buildReadOnlyField(
                                        'City', address['city']),
                                    _buildReadOnlyField(
                                        'Country', address['country']), // Display country
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          InkWell(
                            onTap: _toggleAdd,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  child: IconButton(
                                    onPressed: _toggleAdd,
                                    icon: const Icon(Icons.add_box_outlined),
                                    color: Colors.black,
                                    iconSize: 35,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Add New Address',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
      String label, String initialValue, FormFieldSetter<String> onSaved) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              labelText: label, // Label text for the field
              hintText: 'Enter your $label', // Placeholder text
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 51, 204, 204),
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(97, 97, 97, 1),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
} 