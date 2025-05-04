import 'package:flutter/widgets.dart';

abstract class NotificationWidget {

  Widget build();
}

class EmailNotificationWidget implements NotificationWidget {
  @override
  Widget build() {
    return const Text('Email Notification');
  }
}


class SMSNotificationWidget implements NotificationWidget {
  @override
  Widget build() {
    return const Text('SMS Notification');
  }
}


class PushNotificationWidget implements NotificationWidget {
  @override
  Widget build() {
    return const Text('Push Notification');
  }
}


class NotificationWidgetFactory {
  static NotificationWidget createNotificationWidget( {required String type}) {
    switch (type) {
      case 'email':
        return EmailNotificationWidget();
      case 'sms':
        return SMSNotificationWidget();
      case 'push':
        return PushNotificationWidget();
      default:
        throw Exception('Unknown notification type: $type');
    }
  }
}
