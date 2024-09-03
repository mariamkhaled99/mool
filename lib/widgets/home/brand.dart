import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 252, 255, 190),

      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
      
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Top Brands',
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24,
                fontWeight: FontWeight.bold, 
                
                
              ),
            ),
          ),
          
          Row(
            children: [
              Image.asset(
                'assets/images/brands/brand1.png',
                width: 100,
                height: 100,
              ),
              
              Image.asset(
                'assets/images/brands/brand2.png',
                width: 100,
                height: 100,
              ),
              
              Image.asset(
                'assets/images/brands/brand3.png',
                width: 100,
                height: 100,
              ),
             
              Image.asset(
                'assets/images/brands/brand4.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
         
          Row(
            children: [
              Image.asset(
                'assets/images/brands/brand1.png',
                width: 100,
                height: 100,
              ),
              
              Image.asset(
                'assets/images/brands/brand2.png',
                width: 100,
                height: 100,
              ),
            
              Image.asset(
                'assets/images/brands/brand3.png',
                width: 100,
                height: 100,
              ),
             
              Image.asset(
                'assets/images/brands/brand4.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
