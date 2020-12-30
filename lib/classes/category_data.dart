import 'package:flutter/material.dart';
import 'package:task_app/classes/category.dart';

class CategoryData extends Category {
  static final List<Category> items = [
    Category(categoryName: "Personal", iconCategory: Icons.lock),
    Category(categoryName: "Job", iconCategory: Icons.work),
    Category(categoryName: "Travel", iconCategory: Icons.card_travel),
    Category(categoryName: "Shopping", iconCategory: Icons.shopping_cart),
    Category(categoryName: "Friends", iconCategory: Icons.party_mode),
    Category(categoryName: "Sport", iconCategory: Icons.sports),
    Category(categoryName: "On your mind", iconCategory: Icons.model_training),
  ];
}
