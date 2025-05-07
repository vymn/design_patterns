  import 'package:flutter/material.dart';
  
  
  class PatternCategory extends StatelessWidget {
    final String title;
    final String description;
    final List<Widget> patterns;

    const PatternCategory({
      super.key,
      required this.title,
      required this.description,
      required this.patterns,
    });

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),
          ...patterns,
        ],
      );
    }
  }
