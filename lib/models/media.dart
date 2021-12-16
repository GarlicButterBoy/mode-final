//import 'package:flutter/foundation.dart';

class Media extends Comparable {
  final int id;
  final String name;
  final double rating;
  final DateTime date;
  final String type;
  final String review;

  Media(
      {required this.id,
      required this.name,
      required this.rating,
      required this.date,
      required this.type,
      required this.review});

  @override
  int compareTo(other) {
    if (rating > other.rating) {
      return -1;
    } else if (rating == other.rating) {
      return 0;
    } else {
      return 1;
    }
  }
}
