import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/noti.png',
                  width: 45,
                  height: 45,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('We thought you’d like a new winter \n collections', style:  TextStyle(
                                color: Colors.black,
                               
                                fontSize: 20,
                              ),)
              ],
            ),
            const Padding(
              padding:  EdgeInsets.only(right: 200.0),
              child: Text('3 days ago ',textAlign: TextAlign.left,),
            ),
            const SizedBox(
                  height: 10,
                ),
          ],
        ));
  }
}
