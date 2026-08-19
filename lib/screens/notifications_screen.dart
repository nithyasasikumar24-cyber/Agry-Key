import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Weather Alert"),
            subtitle: Text("Rain expected tomorrow."),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Market Update"),
            subtitle: Text("Rice price increased by 2.5%"),
          ),
        ],
      ),
    );
  }
}