import 'package:flutter/material.dart';

class NotificationsScreens extends StatefulWidget {
  const NotificationsScreens({super.key});

  @override
  State<NotificationsScreens> createState() => _NotificationsScreensState();
}

class _NotificationsScreensState extends State<NotificationsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notifications")),
      body: Container(
          color: Colors.green[100],
          child: Center(child: Text("Notifications screen"))),
    );
  }
}
