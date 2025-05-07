import 'package:design_patterns/creational/builder/alert_builder.dart';
import 'package:flutter/material.dart';

class BuilderPatternDemo extends StatelessWidget {
  const BuilderPatternDemo({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Builder Pattern - Alert Dialog', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertBuilder()
                    .setTitle('Custom Alert')
                    .setMessage('This alert was created using the Builder pattern')
                    .setIcon(Icons.info)
                    .setButtonText('Got it!')
                    .setOnButtonPressed(() {
                      Navigator.of(context).pop();
                    })
                    .build(),
                );
              },
              child: const Text('Show Custom Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
