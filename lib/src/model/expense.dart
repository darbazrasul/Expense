import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// ignore: constant_identifier_names
enum Catagory { Food, Travel, Shopping, Medical, Other }
 final formatter=  DateFormat.yMd();
const catagoryIcon = {
  Catagory.Food:Icons.fastfood,
  Catagory.Travel: Icons.airplanemode_active,
  Catagory.Shopping:Icons.shopping_cart,
  Catagory.Medical: Icons.local_hospital,
  Catagory.Other: Icons.category,
};
const uuid = Uuid();

class Expense {
  final String id;
  final double amount;
  final String title;
  final DateTime date;
  final Catagory catagory;

  String get formatter{
    return DateFormat.yMd().format(date);
  }

  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.catagory,
  }) : id = const Uuid().v4();
}
