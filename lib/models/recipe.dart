import 'package:flutter/material.dart';

class Recipe {
  final String id;
  final String title;
  final List<String> ingredients;
  final String recipe;
  final String image;
  final String author;
  final String category;

  const Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.recipe,
    required this.image,
    required this.author,
    required this.category,
  });
}
