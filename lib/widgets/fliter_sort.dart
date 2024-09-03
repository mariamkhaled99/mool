
import 'package:flutter/material.dart';

class FliterSort extends StatefulWidget {
  const FliterSort({super.key});

  @override
  State<FliterSort> createState() => _FliterSortState();
}

class _FliterSortState extends State<FliterSort> {
 

  @override
  Widget build(BuildContext context) {return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Row(
                      children: [IconButton(
                    icon: Image.asset('assets/images/sort.png',
                        width: 100, height: 100),
                    onPressed: () {
                      
                    },
                  ),
                        const Text('SORT', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 1,
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        IconButton(
                    icon: Image.asset('assets/images/filter-search.png',
                        width: 100, height: 100),
                    onPressed: () {
                      // Handle logo action if needed
                    },
                  ),
                        const Text('FILTER', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
              ],
            )
  ;}}
                



            // Row(children: [IconButton(
            //         icon: Image.asset('assets/images/sort.png',
            //             width: 100, height: 100),
            //         onPressed: () {
                      
            //         },
            //       ),SizedBox(width: 10,),Text('SORT'),IconButton(
            //         icon: Image.asset('assets/images/filter-search.png',
            //             width: 100, height: 100),
            //         onPressed: () {
            //           // Handle logo action if needed
            //         },
            //       ),SizedBox(width: 10,),Text('FILTER')])