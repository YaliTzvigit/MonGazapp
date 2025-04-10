
// Se déconnecter 

import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('Déconnexion'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout,
              color: Colors.redAccent,
              size: 80,
            ),
            const SizedBox(height: 20),
            const Text(
              'Êtes-vous sûr de vouloir vous déconnecter ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Logique > Utilisateur déconnecté : 
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Vous êtes déconnecté !')),
                );
                Navigator.pushReplacementNamed(context, '/auth');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Se déconnecter'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Naviguer vers l'accueil si l'utilisateur change d'avis
                Navigator.pop(context);
              },
              child: const Text(
                'Annuler',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
