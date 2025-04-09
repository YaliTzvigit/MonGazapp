import 'package:flutter/material.dart';
import 'auth.dart'; // Assurez-vous que le chemin d'importation est correct

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Icon(
                  Icons.local_fire_department,
                  size: 100,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Bienvenue sur Mon Gaz',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily:
                        'Montserrat', // Application de la police Montserrat
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Suivez votre niveau de gaz en temps réel.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 11, 128, 98), // Couleur de fond
                      textStyle: const TextStyle(
                        fontFamily:
                            'Montserrat', // Application de la police Montserrat
                        fontSize: 20, // Taille de police
                        fontWeight: FontWeight.normal, // Épaisseur de la police
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AuthPage()), // De homepage > authpage
                      );
                    },
                    child: const Text(
                      "Démarrer",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
