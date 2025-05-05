import 'package:design_patterns/creational/builder/alert_builder.dart';
import 'package:design_patterns/creational/factory/notification_widget.dart';
import 'package:design_patterns/creational/singleton/singleton.dart';
import 'package:design_patterns/memento/form_state.dart' as custom_form;
import 'package:design_patterns/memento/form_state.dart';
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
        title: const Text('Design Patterns Demo'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildStrategyPatternDemo(),
          const Divider(),
          _buildBuilderPatternDemo(),
          const Divider(),
          _buildFactoryPatternDemo(),
          const Divider(),
          _buildSingletonPatternDemo(),
          const Divider(),
          _buildMementoPatternDemo(),
        ],
      ),
    );
  }

  Widget _buildStrategyPatternDemo() {
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Strategy Pattern - Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: LoginType.values.map((type) {
                return ElevatedButton(
                  onPressed: () {
                    final strategies = {
                      LoginType.google: GoogleLoginStrategy(),
                      LoginType.facebook: FacebookLoginStrategy(),
                      LoginType.email: EmailLoginStrategy(),
                    };
                    _login.setStrategy(strategies[type]!);
                    _login.login('user@example.com', 'password');
                  },
                  child: Text('Login with ${type.name}'),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBuilderPatternDemo() {
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

  Widget _buildSingletonPatternDemo() {
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



