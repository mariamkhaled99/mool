import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mool/models/products.dart';
import 'package:mool/providers/add_cart_provider.dart';
import 'package:mool/screens/payment/finished.dart';
import 'package:mool/screens/payment/payment.dart';
import 'package:mool/screens/payment/shipping.dart';
import 'package:mool/screens/payment/submit_order.dart'; // Import the new screen
import 'package:mool/widgets/stepper.dart'; // Import the custom stepper widget

class CheckoutFirstScreen extends ConsumerStatefulWidget {
  final List<Product> products;

  const CheckoutFirstScreen({
    super.key,
    required this.products,
  });

  @override
  _CheckoutFirstScreenState createState() => _CheckoutFirstScreenState();
}

class _CheckoutFirstScreenState extends ConsumerState<CheckoutFirstScreen> {
  int activeStep = 0; // Keep track of the current step
  PageController _pageController = PageController();

  void _onStepChanged(int index) {
    setState(() {
      activeStep = index;
      _pageController.jumpToPage(index);
    });
  }

  void _nextStep() {
    if (activeStep < 3) {
      // Allow up to 3 steps (including the new step)
      setState(() {
        activeStep++;
        _pageController.animateToPage(
          activeStep,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const OrderSubmittedScreen()),
      );
    }
  }

  void _previousStep() {
    if (activeStep > 0) {
      setState(() {
        activeStep--;
        _pageController.animateToPage(
          activeStep,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample addresses for demonstration purposes
    List<Map<String, String>> addresses = [
      {
        'name': 'John Doe',
        'street': '123 Elm Street',
        'buildingNo': '4B',
        'city': 'Metropolis',
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 232, 232, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 90,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'CheckOut',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          // White section with custom stepper
          Container(
            color: activeStep == 3
                ? const Color.fromARGB(255, 247, 247, 247)
                : Colors.white,
            height: 90, // Set the fixed height here
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: CustomStepper(
                currentStep: activeStep,
                onStepTapped: _onStepChanged,
                steps: ['Shipping', 'Payment', 'Review'],
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => _onStepChanged(index),
              children: [
                ShippingScreen(products: widget.products),
                PaymentScreen(),
                ReviewScreen(addresses: addresses), // Pass the addresses here
                OrderSubmittedScreen(), // Add the new screen here
              ],
            ),
          ),
          // Bottom navigation buttons
          activeStep == 3
              ? Container(color: Colors.white) // Container for activeStep == 3
              : (activeStep == 2 // Container for activeStep == 2
                  ? Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Order Summary',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '2500',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shipping Fee',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '50 AED',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                '2550 SAR',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                              ),
                              onPressed: _nextStep,
                              child: Text(
                                "Submit Order",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          onPressed: _nextStep,
                          child: Text(
                            activeStep == 2
                                ? "Submit Order"
                                : "Confirm and Continue",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ))
        ],
      ),
    );
  }
}
