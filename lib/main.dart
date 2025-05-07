import 'package:design_patterns/creational/builder/alert_builder.dart';
import 'package:design_patterns/creational/factory/notification_widget.dart';
import 'package:design_patterns/creational/singleton/singleton.dart';
import 'package:design_patterns/behavioral/memento/form_state.dart' as custom_form;
import 'package:design_patterns/behavioral/memento/form_state.dart';
import 'package:design_patterns/demo/presentation/screens/builder_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/screens/singleton_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/screens/strategy_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/widgets/category_builder.dart';
import 'package:design_patterns/demo/presentation/widgets/pattern_card.dart';
import 'package:flutter/material.dart';
import 'package:design_patterns/structural/strategy/strategy.dart';

void main() {
  final config = AppConfig();
  print('API URL: ${config.apiUrl}');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Patterns Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Login _login = Login();
  final custom_form.FormState _formState = custom_form.FormState();
  final FormStateManager _formStateManager = FormStateManager();
  String _currentNotificationType = 'email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Design Patterns Playbook'),
        centerTitle: true,
        elevation: 2,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          PatternCategory(
            title: 'Creational Patterns',
            description: 'Patterns that deal with object creation mechanisms.',
            patterns: [
              PatternCard(title: 'Builder Pattern', description: 'Separates the construction of a complex object from its representation.', demo: BuilderPatternDemo(context: context)),
              PatternCard(title: 'Factory Pattern', description: 'Creates objects without exposing the instantiation logic.', demo: _buildFactoryPatternDemo()),
              PatternCard(title: 'Singleton Pattern', description: 'Ensures a class has only one instance and provides a global point of access to it.', demo: SingletonPatternDemo()),
            ],
          ),
          const SizedBox(height: 24),
          PatternCategory(
            title: 'Structural Patterns',
            description: 'Patterns that focus on class and object composition.',
            patterns: [
              PatternCard(title: 'Strategy Pattern', description: 'Defines a family of algorithms and makes them interchangeable.', demo: StrategyPatternDemo(_login: _login)),
            ],
          ),
          const SizedBox(height: 24),
          PatternCategory(
            title: 'Behavioral Patterns',
            description: 'Patterns that identify common communication patterns between objects.',
            patterns: [
              PatternCard(title: 'Memento Pattern', description: 'Captures and externalizes an object\'s internal state.', demo: _buildMementoPatternDemo()),
            ],
          ),
        ],
      ),
    );
  }
  
  Widget _buildFactoryPatternDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Factory Pattern - Notifications', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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

  Widget _buildMementoPatternDemo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Memento Pattern - Form State', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                _formState.name = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                _formState.email = value;
              },
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _formStateManager.save(_formState);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form state saved')),
                    );
                  },
                  child: const Text('Save State'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formStateManager.restore(_formState);
                    setState(() {}); // Rebuild to show restored values
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form state restored')),
                    );
                  },
                  child: const Text('Restore State'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
