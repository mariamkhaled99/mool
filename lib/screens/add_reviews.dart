import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mool/providers/review_provider.dart'; // Adjust the import path as necessary

class ReviewScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true, // Ensure resizing with keyboard
      backgroundColor: const Color.fromARGB(255, 230, 228, 228),
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
          'Write Review',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),
              RatingBar.builder(
                initialRating: reviewState.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 45.0,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: reviewState.rating == 0 ? Colors.grey : Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  ref.read(reviewProvider.notifier).updateRating(rating);
                },
                unratedColor: const Color.fromARGB(255, 176, 175, 175),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Rate Product',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 51, 204, 204),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Container(
                  color: const Color.fromARGB(255, 227, 226, 226),
                  child: const Text(
                    'Write Review',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: TextFormField(
                  initialValue: reviewState.reviewText,
                  decoration: const InputDecoration(
                    hintText: 'type your review here',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 12.0,
                    ),
                  ),
                  maxLines: 5,
                  onChanged: (text) {
                    ref.read(reviewProvider.notifier).updateReviewText(text);
                  },
                ),
              ),
              Container(
                  color: const Color.fromARGB(255, 230, 228, 228),
                  child: const SizedBox(height: 80.0)),
              Container(
                color: const Color.fromARGB(255, 230, 228, 228),
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      ref.read(reviewProvider.notifier).saveReview();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Submit review',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
