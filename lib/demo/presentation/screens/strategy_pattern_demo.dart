import 'package:design_patterns/structural/strategy/strategy.dart';
import 'package:flutter/material.dart';

class StrategyPatternDemo extends StatelessWidget {
  const StrategyPatternDemo({
    super.key,
    required Login login,
  }) : _login = login;

  final Login _login;

  @override
  Widget build(BuildContext context) {
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
}
