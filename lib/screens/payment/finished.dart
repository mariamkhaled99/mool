import 'package:flutter/material.dart';
import 'package:mool/utils/form_utils.dart';

class ReviewScreen extends StatefulWidget {
  final List<Map<String, String>> addresses;

  const ReviewScreen({
    Key? key,
    required this.addresses,
  }) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool _isEditing = false;
  int? _editingIndex; // Index of the address being edited
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _street = '';
  String _buildingNo = '';
  String _city = '';
  bool _isEditingPayment = false;

  void _toggleEdit(int index) {
    setState(() {
      _isEditing = true;
      _editingIndex = index;
      _name = widget.addresses[index]['name']!;
      _street = widget.addresses[index]['street']!;
      _buildingNo = widget.addresses[index]['buildingNo']!;
      _city = widget.addresses[index]['city']!;
    });
  }

  void _saveChanges() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      if (_editingIndex != null) {
        setState(() {
          widget.addresses[_editingIndex!] = {
            'name': _name,
            'street': _street,
            'buildingNo': _buildingNo,
            'city': _city,
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
              'Please confirm your order',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              children: [
                Container(
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text(
                                        'Payment',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ), InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          'Edit',
                                          style: TextStyle(
                                              color: Color(0xFF33CCCC)),
                                        ),
                                      ),],
                          ),
                        ),Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [const Text(
                                        '**** **** **** 1234',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                         
                                        ),
                                      ), InkWell(
                                        onTap: () {},
                                        child: const Text(
                                          '9/25',
                                          style: TextStyle(
                                               color: Colors.black, fontSize: 20,),
                                        ),
                                      ),],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            _isEditing
                ? Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildFormField(
                              'Name', _name, (value) => _name = value!),
                          _buildFormField(
                              'Street', _street, (value) => _street = value!),
                          _buildFormField('Building No.', _buildingNo,
                              (value) => _buildingNo = value!),
                          _buildFormField(
                              'City', _city, (value) => _city = value!),
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: _saveChanges,
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black,
                              ),
                              child: const Text('Save Changes'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      ...widget.addresses.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> address = entry.value;
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Shipping Address',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                _buildReadOnlyField('Name', address['name']!),
                                _buildReadOnlyField(
                                    'Street', address['street']!),
                                _buildReadOnlyField(
                                    'Building No.', address['buildingNo']!),
                                _buildReadOnlyField('City', address['city']!),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ],
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
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              labelText: label,
              hintText: 'Enter your $label',
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
