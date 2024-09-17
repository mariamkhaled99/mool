import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String orderId;
  final bool isCanceled;
  final bool isShipped;
  final bool isDelivered;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.isCanceled,
    required this.isShipped,
    required this.isDelivered,
  });

  @override
  OrderDetailsScreenState createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 236, 236),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            Text('Order ${widget.orderId}', style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            Expanded(
              child: ListView(
                children: [
                  OrderDetailsCard(orderId: widget.orderId),
                  const SizedBox(height: 10),
                  ShipmentDetailsCard(
                      isCanceled: widget.isCanceled,
                      isShipped: widget.isShipped,
                      isDelivered: widget.isDelivered),
                  const SizedBox(height: 10),
                  PaymentMethodCard(),
                  const SizedBox(height: 10),
                  ShippingAddressCard(),
                  const SizedBox(height: 10),
                  OrderSummaryCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  final String orderId;

  const OrderDetailsCard({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              'Order Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Order ',
                  style: TextStyle(fontSize: 18.0),
                ),
                // Updated orderId dynamically
                 Text(
                  orderId, // Replace with variable orderId
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              'Placed On Aug 23, 2022',
              style: TextStyle(
                  fontSize: 14.0, color: Color.fromARGB(255, 87, 86, 86)),
            ),
            Row(
              children: [
                Text(
                  'Order Total',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 20),
                Text(
                  '2550 SAR',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Promo Code  ',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  'MO10',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' Applied',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShipmentDetailsCard extends StatelessWidget {
  final bool isCanceled;
  final bool isShipped;
  final bool isDelivered;

  const ShipmentDetailsCard({
    super.key,
    required this.isCanceled,
    required this.isShipped,
    required this.isDelivered,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the bar colors based on shipment status
    Color barColor1 = isShipped || isDelivered
        ? Colors.green
        : isCanceled
            ? Colors.red
            : Colors.grey;
    Color barColor2 = isShipped || isDelivered ? Colors.green : Colors.grey;
    Color barColor3 = isShipped || isDelivered ? Colors.green : Colors.grey;
    Color barColor4 = isDelivered ? Colors.green : Colors.grey;

    String statusText =
        isCanceled ? 'Canceled' : (isDelivered ? 'Delivered' : 'Shipped');
    Color statusColor =
        isCanceled ? Colors.red : (isDelivered ? Colors.green : Colors.black);

    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shipment Details',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  color: barColor1,
                  height: 3.0,
                  width: 70.0,
                ),
                const SizedBox(width: 8.0),
                Container(
                  color: barColor2,
                  height: 3.0,
                  width: 70.0,
                ),
                const SizedBox(width: 8.0),
                Container(
                  color: barColor3,
                  height: 3.0,
                  width: 70.0,
                ),
                const SizedBox(width: 8.0),
                Container(
                  color: barColor4,
                  height: 3.0,
                  width: 70.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              statusText,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Delivery Estimate',
                style: TextStyle(
                    fontSize: 14.0, color: Color.fromARGB(255, 68, 68, 68)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Thursday , 1 September 2022 before 9pm',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            //
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items to the start
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the border radius as needed
                    child: SizedBox(
                      width: 90,
                      height: 100.0, // Height of the image
                      child: Image.asset(
                        'assets/images/card2.jpeg',
                        fit: BoxFit
                            .cover, // Ensures the image covers the container without distortion
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                ' Elegant Blazer\n with nice luxury\n fabric.............',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    height:
                                        1.2), // Adjust the height to fit your needs
                              ),
                            ),
                            Text(
                              '2500 SAR',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text('Sold By Zara'),
                        Text(
                          'QTY 1 x 2500',
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(255, 195, 195, 195),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          ' Write Review',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFF33CCCC),
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1.0,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Track Shipment'),
                Icon(Icons.arrow_forward_ios, size: 16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'Credit Card Ending in',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(width: 20),
                Text(
                  '**** 2548',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShippingAddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Address',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '1234 Elm Street',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Springfield, IL 62704',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Item 1 - \$50.00',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Item 2 - \$25.00',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '\$75.00',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping',
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  '\$5.00',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$80.00',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
