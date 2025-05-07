import 'package:design_patterns/creational/factory/notification_widget.dart';
import 'package:flutter/material.dart';

class FactoryPatternDemo extends StatefulWidget {
  const FactoryPatternDemo({super.key});

  @override
  State<FactoryPatternDemo> createState() => _FactoryPatternDemoState();
}

class _FactoryPatternDemoState extends State<FactoryPatternDemo> {
  String _currentNotificationType = 'email';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Factory Pattern - Notifications', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: ['email', 'sms', 'push'].map((type) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentNotificationType = type;
                    });
                  },
                  child: Text('Create $type notification'),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: NotificationWidgetFactory.createNotificationWidget(
                type: _currentNotificationType,
              ).build(),
            ),
          ],
        ),
      ),
    );
  }
}