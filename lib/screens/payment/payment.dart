import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = '';

  // Key for the form to validate credit card fields
  final _formKey = GlobalKey<FormState>();

  // Controllers for credit card form fields
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _giftCardController = TextEditingController();

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _nameOnCardController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
      _giftCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(233, 232, 232, 1),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Payment Method',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16.0),

                // Cash on Delivery Radio
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    leading: Radio<String>(
                      value: 'Cash',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    title: const Text(
                      'Cash on Delivery',
                      style: TextStyle(
                        color: Colors.black,
                       fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),

                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Radio<String>(
                          value: 'Credit Card',
                          groupValue: _selectedPaymentMethod,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedPaymentMethod = value!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                        title: const Text(
                          'Credit Card',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Ensures the row takes minimal space
                          children: [
                            Image.asset(
                              'assets/images/visa.png',
                              width: 40, // Adjusted size to fit within the row
                              height: 40,
                            ),
                            const SizedBox(
                                width: 8.0), // Add spacing between the logos
                            Image.asset(
                              'assets/images/Mastercard.png',
                              width: 40, // Adjusted size to fit within the row
                              height: 40,
                            ),
                          ],
                        ),
                      ), if (_selectedPaymentMethod == 'Credit Card')
                 
                    
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        // border: Border.all(color: Colors.grey),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name on Card
                            const Text('Name on Card' ,style: TextStyle(color:Color.fromARGB(255, 97, 97, 97)),),
                            TextFormField(
                              controller: _nameOnCardController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                // hintText: 'Enter your name as it appears on the card',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the name on the card';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),

                            // Card Number
                            const Text('Card Number' ,style: TextStyle(color:Color.fromARGB(255, 97, 97, 97)),),
                            TextFormField(
                              controller: _cardNumberController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '**** **** **** ****',
                                  hintStyle: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a card number';
                                }
                                if (value.length != 16) {
                                  return 'Card number must be 16 digits';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16.0),

                            // Expiry Date and CVV
                            Row(
                              children: [
                                // Expiry Date
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Expiry Date' ,style: TextStyle(color:Color.fromARGB(255, 97, 97, 97)),),
                                      TextFormField(
                                        controller: _expiryDateController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'MM/YY',
                                            hintStyle: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                                        ),
                                        keyboardType: TextInputType.datetime,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the expiry date';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16.0),

                                // CVV
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Security Code' ,style: TextStyle(color:Color.fromARGB(255, 97, 97, 97)),),
                                      TextFormField(
                                        controller: _cvvController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          // hintText: 'Enter your CVV',
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter the CVV';
                                          }
                                          if (value.length != 3) {
                                            return 'CVV must be 3 digits';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                    ],
                  ),
                ),
                
               

                // Paymob Radio
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: ListTile(
                    leading: Radio<String>(
                      value: 'Paymob',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    title: const Text(
                      'Paymob',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Image.asset(
                      'assets/images/PayMob.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),

                // Gift Cards and Promotional Codes Section
                const SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gift Cards and Promotional Codes',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            // Gift Card Input Field
                            Expanded(
                              child: TextFormField(
                                controller: _giftCardController,
                                decoration: const InputDecoration(
                                  
                                  border: OutlineInputBorder( borderSide: BorderSide(
                                  color: Color.fromARGB(255, 97, 97, 97), // Border color
                                ),),
                                  
                                 
                                  hintText: 'Enter code',
                                   hintStyle: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                                  
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),

                             ElevatedButton(
                            onPressed: () {
                             
                            },
                            child:  const Text('Apply'),
                            style: ElevatedButton.styleFrom(
                              foregroundColor:const  Color.fromARGB(255, 56, 188, 221), backgroundColor: Colors.white, // Text color
                              side: const BorderSide(
                                color: Color.fromARGB(255, 56, 188, 221), // Border color
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Add space for keyboard
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom+260),
              ],
         
              
            ),
          ),
        ),
      ),
    );
  }
}
