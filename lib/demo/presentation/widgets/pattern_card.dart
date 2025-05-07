import 'package:flutter/material.dart';


class PatternCard extends StatelessWidget {
  const PatternCard({
    super.key,
    required this.title,
    required this.description,
    required this.demo,
  });

  final String title;
  final String description;
  final Widget demo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            description,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: demo,
          ),
        ],
      ),
    );
  }
}



