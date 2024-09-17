import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingSection extends StatefulWidget {
  @override
  _RatingSectionState createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  double _rating = 4.0;
  List<double> _percentages = [20, 15, 25, 10, 30]; // Example percentages

  @override
  Widget build(BuildContext context) {
    return Flexible(
      
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Medium Rating Star
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30.0, // Adjust size as needed
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _rating = rating;
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  // Numbers Row
                  Row(
                    children: List.generate(6, (index) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            index.toString(),
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              SizedBox(width: 2.0),
              // Right Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        // Star
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        // Bar
                        Expanded(
                          child: Container(
                            height: 10.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey[300],
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: _percentages[index] / 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        // Percentage
                        Text(
                          '${_percentages[index].toStringAsFixed(0)}%',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
       
      ),
    );
  }
}
