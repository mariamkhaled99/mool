import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isEditing = false;
  bool _isAdding = false;
  int? _editingIndex; // Index of the address being edited
  List<Map<String, dynamic>> _addresses = [];

  String _name = '';
  String _street = '';
  String _buildingNo = '';
  String _city = '';

  void _toggleEdit(int index) {
    setState(() {
      _isEditing = true;
      _isAdding = false;
      _editingIndex = index;
      _name = _addresses[index]['name'];
      _street = _addresses[index]['street'];
      _buildingNo = _addresses[index]['buildingNo'];
      _city = _addresses[index]['city'];
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
          };
          _isEditing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _hasAddress = _addresses.isNotEmpty;

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
        title: const Text('Add Address', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _isEditing || _isAdding
                    ? Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildFormField(
                                      'Name', _name, (value) => _name = value!),
                                  _buildFormField('Street', _street,
                                      (value) => _street = value!),
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
                                      child: Text(_isAdding
                                          ? 'Add Address'
                                          : 'Save Changes'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: _hasAddress
                              ? Column(
                                  children: [
                                    ..._addresses.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      Map<String, dynamic> address =
                                          entry.value;
                                      return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      'Shipping Address',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () =>
                                                          _toggleEdit(index),
                                                      child: const Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF33CCCC)),
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
                                                  'Building No.',
                                                  address['buildingNo']),
                                              _buildReadOnlyField(
                                                  'City', address['city']),
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
                                              icon: const Icon(
                                                  Icons.add_box_outlined),
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
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                            'assets/images/No Address.png'),
                                        const SizedBox(height: 16.0),
                                        const Text(
                                          'No Address Yet',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        const Text(
                                          'Please add your address for your better experience',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16.0),
                                        TextButton(
                                          onPressed: _toggleAdd,
                                          style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            minimumSize: const Size(200,
                                                50), // Width and height of the button
                                            padding: const EdgeInsets.symmetric(
                                                horizontal:
                                                    16.0), // Padding inside the button
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  12.0), // Border radius for rounded corners
                                            ),
                                          ),
                                          child: const Text('Add Address'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                const SizedBox(height: 20),
              ],
            ),
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
}
