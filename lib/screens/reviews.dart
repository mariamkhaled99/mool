import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mool/providers/review_provider.dart'; // Adjust the import path as necessary

// Custom Widget for a Review
class ReviewWidget extends StatelessWidget {
  final double rating;
  final String reviewText;

  const ReviewWidget({
    required this.rating,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity, // Ensure it takes the full width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Image on the left
                Image.asset(
                  'assets/images/i.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),
                // Middle Column: User Name and Star Rating
                Column(
                  children: [
                    const Text(
                      'Nourhan Selim', // Static name
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: rating,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18.0,
                    ),
                  ],
                ),
                // Date on the right
                const Text(
                  '1st August 2022', // Static date
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Very elegant product', // Static heading for all reviews
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              reviewText, // Dynamic review text
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8.0),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

// Main Widget for displaying the reviews
class ReviewsSummaryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewProvider);
    final starRatings = [5, 10, 15, 40, 30];
    final totalRatings = starRatings.reduce((a, b) => a + b);
    final averageRating = 3.95;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 90,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
           color:  Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1, // Make sure it takes up a portion of the width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBarIndicator(
                          rating: averageRating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 30.0,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          averageRating.toStringAsFixed(2),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2, // Ensure it takes the available width
                    child: Column(
                      children: List.generate(5, (index) {
                        int starCount = 5 - index;
                        double percentage = starRatings[starCount - 1] / totalRatings;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
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
              const SizedBox(height: 32.0),
              const Divider(),
              // Reviews Section
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              reviewState.reviews.isEmpty
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'No reviews yet.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : Column(
                      children: List.generate(reviewState.reviews.length, (index) {
                        final review = reviewState.reviews[index];
                        return ReviewWidget(
                          rating: review.rating,
                          reviewText: review.reviewText,
                        );
                      }),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
