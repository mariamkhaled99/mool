import 'package:flutter_riverpod/flutter_riverpod.dart';

final reviewProvider = StateNotifierProvider<ReviewNotifier, ReviewState>(
  (ref) => ReviewNotifier(),
);

// Model for individual reviews
class Review {
  final double rating;
  final String reviewText;

  Review({required this.rating, required this.reviewText});
}

// State class for storing the current review and list of all reviews
class ReviewState {
  final double rating;
  final String reviewText;
  final List<Review> reviews;

  // Initialize with default values
  ReviewState({this.rating = 0.0, this.reviewText = '', this.reviews = const []});

  // CopyWith to update the state immutably
  ReviewState copyWith({double? rating, String? reviewText, List<Review>? reviews}) {
    return ReviewState(
      rating: rating ?? this.rating,
      reviewText: reviewText ?? this.reviewText,
      reviews: reviews ?? this.reviews,
    );
  }
}

class ReviewNotifier extends StateNotifier<ReviewState> {
  ReviewNotifier() : super(ReviewState());

  // Update the rating
  void updateRating(double newRating) {
    state = state.copyWith(rating: newRating);
  }

  // Update the review text
  void updateReviewText(String newText) {
    state = state.copyWith(reviewText: newText);
  }

  // Save the current review and add it to the reviews list
  void saveReview() {
    // Create a new Review object from the current state
    final newReview = Review(rating: state.rating, reviewText: state.reviewText);
    
    // Add the new review to the list and reset the current rating and text
    state = state.copyWith(
      reviews: [...state.reviews, newReview], // Append new review
      rating: 0.0, // Reset rating after saving
      reviewText: '', // Reset review text after saving
    );

    // Log the review to the console (you could replace this with saving to a database or API)
    print('Saved Review: Rating - ${newReview.rating}, Text - ${newReview.reviewText}');
  }
}
