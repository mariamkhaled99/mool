import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderNotifier extends StateNotifier<String> {
  GenderNotifier() : super('Women'); // Default Gender

  void selectGender(String gender) {
    state = gender;
  }
}

final genderProvider = StateNotifierProvider<GenderNotifier, String>((ref) {
  return GenderNotifier();
});
