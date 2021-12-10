import 'package:flutter/foundation.dart';

class Plant {
  final String id; 
  final String name;
  final double amount;
  final DateTime date;
  final String type;

  Plant({
    required this.id, 
    required this.name, 
    required this.amount, 
    required this.date,
    required this.type
    });

}