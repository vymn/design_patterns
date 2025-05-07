import 'package:design_patterns/creational/singleton/singleton.dart';
import 'package:design_patterns/structural/strategy/strategy.dart';
import 'package:design_patterns/demo/presentation/screens/builder_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/screens/factory_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/screens/memento_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/screens/singleton_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/screens/strategy_pattern_demo.dart';
import 'package:design_patterns/demo/presentation/widgets/category_builder.dart';
import 'package:design_patterns/demo/presentation/widgets/pattern_card.dart';
import 'package:flutter/material.dart';

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
              PatternCard(
                title: 'Builder Pattern', 
                description: 'Separates the construction of a complex object from its representation.', 
                demo: BuilderPatternDemo(context: context)
              ),
              PatternCard(
                title: 'Factory Pattern', 
                description: 'Creates objects without exposing the instantiation logic.', 
                demo: const FactoryPatternDemo()
              ),
              PatternCard(
                title: 'Singleton Pattern', 
                description: 'Ensures a class has only one instance and provides a global point of access to it.', 
                demo: const SingletonPatternDemo()
              ),
            ],
          ),
          const SizedBox(height: 24),
          PatternCategory(
            title: 'Structural Patterns',
            description: 'Patterns that focus on class and object composition.',
            patterns: [
              PatternCard(
                title: 'Strategy Pattern', 
                description: 'Defines a family of algorithms and makes them interchangeable.', 
                demo: StrategyPatternDemo(login: _login)
              ),
            ],
          ),
          const SizedBox(height: 24),
          PatternCategory(
            title: 'Behavioral Patterns',
            description: 'Patterns that identify common communication patterns between objects.',
            patterns: [
              PatternCard(
                title: 'Memento Pattern', 
                description: 'Captures and externalizes an object\'s internal state.', 
                demo: const MementoPatternDemo()
              ),
            ],
          ),
        ],
      ),
    );
  }
}
