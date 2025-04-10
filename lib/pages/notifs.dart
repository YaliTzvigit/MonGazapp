


// Gestion des notifs  

import 'package:flutter/material.dart';

class notifPage extends StatefulWidget {
  @override
  _notifPageState createState() => _notifPageState();
}

class _notifPageState extends State<notifPage> {
  bool _isNotificationEnabled = true;

  void _toggleNotification(bool value) {
    setState(() {
      _isNotificationEnabled = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_isNotificationEnabled ? 'Notifications activées' : 'Notifications désactivées')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Gérer vos notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.notifications, color: Colors.blueAccent),
              title: Text("Notifications de gaz faibles"),
              trailing: Switch(
                value: _isNotificationEnabled,
                onChanged: _toggleNotification,
                activeColor: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action de confirmation des changements
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              ),
              child: Text("Sauvegarder les paramètres", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
