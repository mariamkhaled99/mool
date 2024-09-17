import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart'; // Import the country_flags package
import 'package:mool/screens/account/address.dart';
import 'package:mool/screens/account/change_password.dart';
import 'package:mool/screens/account/orders.dart';
import 'package:mool/screens/account/profile.dart';
import 'package:mool/widgets/auth/select_country.dart';
import 'package:mool/widgets/home/navbar.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  String? _selectedCountry;

  final List<String> _countries = [
    'Saudi Arabia',
    'Egypt',
    'United Arab Emirates',
  ];

  // Helper function to map country name to country code
  String getCountryCode(String countryName) {
    switch (countryName) {
      case 'United Arab Emirates':
        return 'ae';
      case 'Saudi Arabia':
        return 'sa';
      case 'Egypt':
        return 'eg';
      default:
        return 'eg'; // Default country code if no match found
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> accountOptions = [
      {
        'icon': Icons.person_outline,
        'text': 'Your Account',
        'route': const ProfileScreen(),
      },
      {
        'icon': Icons.shopping_bag_outlined,
        'text': 'Your Orders',
        'route': const OrdersScreen(),
      },
      {
        'icon': Icons.favorite_outline,
        'text': 'My Favorite',
        'route': const MyAccountScreen(),
      },
      {
        'icon': Icons.location_on_outlined,
        'text': 'Address Book',
        'route': const AddressScreen(),
      },
      {
        'icon': Icons.lock_outline,
        'text': 'Change Password',
        'route': const ChangePasswordScreen(),
      },
      {
        'icon': Icons.language_outlined,
        'text': 'Language',
        // 'route':,
      },
      {'icon': Icons.flag_outlined, 'text': 'Country'}, // Country selection
      {
        'icon': Icons.info_outline,
        'text': 'About Us',
        // 'route': ,
      },
      {
        'icon': Icons.contact_mail_outlined,
        'text': 'Contact Us',
        // 'route': ,
      },
      {
        'icon': Icons.logout_outlined,
        'text': 'Logout',
        // 'route': ,
      },
    ];

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
        title: const Text('My Account', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    itemCount: accountOptions.length,
                    itemBuilder: (context, index) {
                      final option = accountOptions[index];

                      return GestureDetector(
                        onTap: () {
                          if (option['text'] == 'Country') {
                            // Show bottom sheet immediately for country selection
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return CustomDropdown(
                                  items: _countries,
                                  selectedValue: _selectedCountry,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedCountry = value;
                                    });
                                    Navigator.pop(context); // Close the bottom sheet
                                  },
                                );
                              },
                            );
                          } else if (option['route'] != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => option['route'],
                              ),
                            );
                          }
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  option['icon'],
                                  size: 32.0,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Text(
                                    option['text'],
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),
                                if (option['text'] == 'Country')
                                  Row(
                                    children: [
                                      if (_selectedCountry != null)
                                        CountryFlag.fromCountryCode(
                                          getCountryCode(_selectedCountry!),
                                          width: 32,
                                          height: 28,
                                        ),
                                      if (_selectedCountry != null)
                                        const SizedBox(width: 8.0),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: CustomNavbar(selectedIndex: 4), // Custom bottom navbar
            ),
          ),
        ],
      ),
    );
  }
}
