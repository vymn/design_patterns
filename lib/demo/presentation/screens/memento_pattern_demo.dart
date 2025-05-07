import 'package:design_patterns/behavioral/memento/form_state.dart' as custom_form;
import 'package:flutter/material.dart';

class MementoPatternDemo extends StatefulWidget {
  const MementoPatternDemo({super.key});

  @override
  State<MementoPatternDemo> createState() => _MementoPatternDemoState();
}

class _MementoPatternDemoState extends State<MementoPatternDemo> {
  final custom_form.FormState _formState = custom_form.FormState();
  final custom_form.FormStateManager _formStateManager = custom_form.FormStateManager();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Memento Pattern - Form State', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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