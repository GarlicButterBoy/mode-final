import 'package:flutter/foundation.dart';

class Media {
  final String id; 
  final String name;
  final double rating;
  final DateTime date;
  final String type;
  final String review;

  Media({
    required this.id, 
    required this.name, 
    required this.rating, 
    required this.date,
    required this.type,
    required this.review
    });

}