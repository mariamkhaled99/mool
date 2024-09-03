import 'package:mool/screens/best_seller.dart';
import 'package:mool/screens/new_arrival.dart';
import 'package:mool/screens/notification.dart';
import 'package:mool/widgets/home/brand.dart';
import 'package:mool/widgets/home/category_scroller.dart';
import 'package:mool/widgets/home/home_card.dart';
import 'package:mool/widgets/home/slider.dart';
import '../widgets/home/navbar.dart';
import '../widgets/home/product_scroller.dart';
import 'package:mool/models/products.dart';
import 'package:flutter/material.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  String selectedCategory = 'Women';
  bool _isSearchOpen = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 100,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black,
                    height: 20,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'Women';
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Women',
                              style: TextStyle(
                                color: selectedCategory == 'Women'
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 50,
                              color: selectedCategory == 'Women'
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'Men';
                          });
                        },
                        child: Column(
                          children: [
                            Text(
                              'Men',
                              style: TextStyle(
                                color: selectedCategory == 'Men'
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 2,
                              width: 50,
                              color: selectedCategory == 'Men'
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 0,
                  child: IconButton(
                    icon: Image.asset('assets/images/logo.png',
                        width: 100, height: 100),
                    onPressed: () {
                      // Handle logo action if needed
                    },
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 0,
                  child: Row(
                    children: [
                      if (_isSearchOpen)
                        Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      IconButton(
                        icon: Icon(
                          _isSearchOpen ? Icons.close : Icons.search,
                          color: Colors.white,
                          size: 30, // Increased icon size
                        ),
                        onPressed: () {
                          setState(() {
                            _isSearchOpen = !_isSearchOpen;
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 30, // Increased icon size
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CategoryScroller(),
                  Container(
                    color: Colors.white,
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/truck-fast.png',
                            height: 24,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '48 HOURS DELIVERY',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const CustomSlider(),
                  const HomeCard(),
                  const Brand(),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, 
                          children: [
                            const Text(
                              'Best Sellers',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BestSellerScreen(
                                            products:products,
                                          )),
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      ProductScroller(
                        products: products,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: Colors.black,
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Get up to 15% off with code :',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            // color: Colors.black,
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 245, 190, 1),
                                width: 2.0,
                              ),
                            ),
                            child: const Text(
                              'Get15',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                               
                                color: Color.fromARGB(255, 245, 190, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0), // Add some horizontal padding
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Align left and right
                          children: [
                            const Text(
                              'New Arrival',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewArrivalScreen(
                                            products: products,
                                          )), // Replace with your screen
                                );
                              },
                              child: const Row(
                                children: [
                                  Text(
                                    'See All',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10), // Add some spacing
                      ProductScroller(
                        products: products,
                      ),
                    ],
                  ),
                  Container(
                    // color: Colors.white70,
                    child: const SizedBox(
                      height: 140,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child:
                  CustomNavbar(selectedIndex: 0), // CustomNavbar remains on top
            ),
          ),
        ],
      ),
    );
  }
}
