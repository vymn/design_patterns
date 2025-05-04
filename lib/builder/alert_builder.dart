
import 'package:flutter/material.dart';

class AlertBuilder {
  String? _title;
  String? _message;
  String? _type;
  IconData? _icon;
  String? _buttonText;
  VoidCallback? _onButtonPressed;


  AlertBuilder setTitle(String title) {
    _title = title;
    return this;
  }


  AlertBuilder setMessage(String message) {
    _message = message;
    return this;
  }

  AlertBuilder setType(String type) {
    _type = type;
    return this;
  }

  AlertBuilder setIcon(IconData icon) {
    _icon = icon;
    return this;
  }

  AlertBuilder setButtonText(String buttonText) {
    _buttonText = buttonText;
    return this;
  }

  AlertBuilder setOnButtonPressed(VoidCallback onButtonPressed) {
    _onButtonPressed = onButtonPressed;
    return this;
  }

  AlertDialog build() {
    return AlertDialog(
      title: Text(_title ?? 'Default Title'),
      content: Text(_message ?? 'Default Message'),
      actions: [
        TextButton(
          onPressed: _onButtonPressed ?? () {},
          child: Text(_buttonText ?? 'OK'),
        ),
      ],
      icon: _icon != null ? Icon(Icons.warning) : null, // Example icon usage
      backgroundColor: _type == 'error' ? Colors.red : Colors.white, // Example type usage
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}