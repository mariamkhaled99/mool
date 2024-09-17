import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/screens/add_reviews.dart';
import 'package:mool/screens/cart.dart';
import 'package:mool/screens/reviews.dart';
import 'package:mool/widgets/product/colorselector.dart';
// import 'package:mool/widgets/product/rating_section.dart';
import 'package:mool/widgets/product/sizeselector.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mool/models/products.dart';
import 'package:mool/providers/favourite_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mool/providers/add_cart_provider.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final Product product;

  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
  double _rating = 4.0;
  List<double> _percentages = [20, 15, 25, 10, 30]; // Example percentages

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final starRatings = [5, 10, 15, 40, 30];
    final totalRatings = starRatings.reduce((a, b) => a + b);
    final averageRating = 3.95;
    final pageController = PageController();
    final favouriteProducts = ref.watch(favouriteProductsProvider);
    final isFavorite =
        ref.watch(favouriteProductsProvider.notifier).isFavorite(product);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromARGB(
            255, 15, 15, 15), // Change the AppBar color to grey
        title: Padding(
          padding: const EdgeInsets.only(
              left: 1), // Adjust the left padding as needed
          child: Text(
            product.title,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () {
                  // Define action here
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_checkout, color: Colors.white),
                onPressed: () {
                  // Define action here
                },
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 500.0, // Set fixed height for the PageView
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 4, // Number of images
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                product.imagePath,
                                height: 500.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            // ),
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          right: 20,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(favouriteProductsProvider.notifier)
                                  .toggleFavorite(product);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2.0),
                                color: Colors.white,
                              ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 150,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SmoothPageIndicator(
                                controller: pageController,
                                count: 4,
                                effect: const ExpandingDotsEffect(
                                  activeDotColor: Colors.blue,
                                  dotColor: Colors.white,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  spacing: 5.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  height: 2.0,
                  width: 60.0,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Zara',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          'VAT Included',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20.0,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            // Handle rating update
                          },
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          '(22)',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Return Policy',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Define action here
                          },
                        ),
                      ],
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Size',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizeSelector(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColorSelector(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' Description',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' ZARA elegent Two-Button Fitted Blazer for\n Women ZARA elegent Two-Button Fitted\n Blazer for Women',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Color.fromRGBO(78, 78, 78, 1)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Details',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0), // Optional padding
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Align columns to the left
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align columns to the top
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text to the left
                              children: [
                                Text(
                                  'Product Code',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  '745672876',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Shape',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Tiered',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Fabric',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Cotton',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Align text to the left
                              children: [
                                Text(
                                  'Brand',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Zara',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Model wearing size',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'S',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Shape',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Tiered',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Center content vertically
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Center content horizontally
                              children: [
                                // Star Rating
                                RatingBar.builder(
                                  initialRating: 4.0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 30.0, // Increase the star icon size
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    // Handle rating update
                                  },
                                ),
                                const SizedBox(height: 16.0),
                                // Rating Value (3.95)
                                const Text(
                                  '3.95',
                                  style: TextStyle(
                                    fontSize:
                                        24.0, 
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          Expanded(
                            child: Column(
                              children: List.generate(5, (index) {
                                int starCount = 5 - index;
                                double percentage =
                                    starRatings[starCount - 1] / totalRatings;
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    children: [
                                      Text('$starCount stars'),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 1.0,
                                              color: Colors.grey[300],
                                            ),
                                            FractionallySizedBox(
                                              widthFactor: percentage,
                                              child: Container(
                                                height: 1.0,
                                                color: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text('${starRatings[starCount - 1]}'),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // Spreads content
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center content vertically
                        children: [
                          // Image on the left
                          Image.asset(
                            'assets/images/i.png',
                            width: 40.0, // Adjust size as needed
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),

                          // Middle Column: Rating Text and Stars
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Rating Value (3.95)
                             const Text(
                                'Nourhan Selim',
                                style: TextStyle(
                                  fontSize: 18.0, // Adjust font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Star Rating
                              RatingBar.builder(
                                initialRating: 4.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18.0, // Adjust the star icon size
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  // Handle rating update
                                },
                              ),
                            ],
                          ),

                          // Date on the right
                          Text(
                            '1st August 2022',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[600], // Adjust color as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Very elegent product',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'very nice and elegent product and the fabric is awsome',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            // fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                   const  Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'See all reviews',
                          style: TextStyle(
                            fontSize: 24.0,
                            // color: Colors.black,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReviewsSummaryScreen(), // Replace with your screen
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                   
                  ],
                ),
              ),
             Container(
                 color: const Color.fromARGB(255, 237, 237, 237),
                child: const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, top: 30.0, bottom: 30.0),
                child: InkWell(
                  onTap: () {
                    // Navigate to the new screen here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReviewScreen(), // Replace with your screen
                      ),
                    );
                  },
                  child:const  Row(
                    children: [
                       Text(
                        'Write Review',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              Container(
                 color: const Color.fromARGB(255, 237, 237, 237),
                child: const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
              ),
              Container(
                color: Colors.white, // Set container color to white
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Left Column
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/shield-tick.png',
                            width: 50, // Adjust the width as needed
                          ),
                          const SizedBox(height: 8.0), // Space between image and text
                          const Text(
                            'Safe Packaging',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            'Orders are sanitized\nand packed',
                            style: TextStyle(fontSize: 14.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    // Vertical Divider
                    Container(
                      width: 1,
                      height:
                          90, // Slightly smaller than the container's height
                      color: Colors.grey,
                    ),
                    // Right Column
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/back-square.png',
                            width: 50, // Adjust the width as needed
                          ),
                          const SizedBox(height: 8.0), // Space between image and text
                          const Text(
                            'Easy Return',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            '15 Days Easy Return',
                            style: TextStyle(fontSize: 14.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),Container(
                 color: const Color.fromARGB(255, 237, 237, 237),
                child: const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
              ), const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0), // Horizontal padding
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(cartProvider.notifier).addProductToCart(product);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child:  Text('Add To Cart'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
