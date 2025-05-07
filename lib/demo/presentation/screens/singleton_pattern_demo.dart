import 'package:design_patterns/creational/singleton/singleton.dart';
import 'package:flutter/material.dart';

class SingletonPatternDemo extends StatelessWidget {
  const SingletonPatternDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Singleton Pattern - App Config', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text('API URL: ${AppConfig().apiUrl}'),
          ],
        ),
      ),
    );
  }
}
