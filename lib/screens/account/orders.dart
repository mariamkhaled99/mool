import 'package:flutter/material.dart';
import 'package:mool/screens/account/order_details.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  void _showSortingBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Filter Orders',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            ListTile(
              title: const Text('This Month'),
              onTap: () {
                // Update sorting logic here
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Last 6 months'),
              onTap: () {
                // Update sorting logic here
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Last Year'),
              onTap: () {
                // Update sorting logic here
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  void _navigateToOrderDetail(String orderId, bool isCanceled, bool isShipped, bool isDelivered) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(orderId: orderId,isCanceled: isCanceled,
        isShipped: isShipped,
        isDelivered: isDelivered,),
      ),
    );
  }

  Widget _buildOrderItem(int index) {
    bool isCanceled = index == 0;
    bool isShipped = index == 1;
    bool isDelivered = index == 2;
    String orderId = 'A255DSD5FF${index + 1}';
    return GestureDetector(
      onTap: () => _navigateToOrderDetail(
        orderId,
        isCanceled,
        isShipped,
        isDelivered,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Order ',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  'A255DSD5FF',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '25000 SAR',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Placed On Aug 23, 2022',
                  style: TextStyle(color: Color.fromARGB(255, 87, 86, 86)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  height: 1.0,
                  color: const Color.fromARGB(255, 237, 236, 236),
                  width: double.infinity,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Elegent Blazer DARK BLA..',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Elegent Blazer...................',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Write Review',
                    style: TextStyle(color: Color(0xFF33CCCC)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  color:
                      isCanceled ? Colors.red : Color.fromRGBO(13, 207, 9, 1),
                  height: 3.0,
                  width: 70.0,
                ),
                const SizedBox(width: 8.0),
                Container(
                  color:
                      isCanceled ? Colors.red : Color.fromRGBO(13, 207, 9, 1),
                  height: 3.0,
                  width: 70.0,
                ),
                const SizedBox(width: 8.0),
                Container(
                  color:
                      isCanceled ? Colors.red : Color.fromRGBO(13, 207, 9, 1),
                  height: 3.0,
                  width: 70.0,
                ),
                const SizedBox(width: 8.0),
                Container(
                  color: Colors.grey,
                  height: 3.0,
                  width: 70.0,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              isCanceled ? 'Canceled' : 'Delivered',
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color:
                      isCanceled ? Colors.red : Color.fromRGBO(13, 207, 9, 1)),
            ),
            if (isCanceled)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Order canceled by vendor',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Add Orders', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 50.0,
                      ),
                      hintText: 'Search all your orders ',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 210, 210, 210),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Container(
                  color: Colors.black,
                  width: 1.0,
                  height: 40.0,
                ),
                const SizedBox(width: 16.0),
                Row(
                  children: [
                    const Text(
                      'Filters',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 16.0,
                      ),
                      onPressed: _showSortingBottomSheet,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: List.generate(3, (index) => _buildOrderItem(index)),
            ),
          ),
        ],
      ),
    );
  }
}
