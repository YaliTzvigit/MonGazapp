
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
                  'Bienvenue sur MonGaz',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily:
                        'Nunito', // Application de la police Montserrat
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Suivez votre niveau de gaz en temps réel.',
                  style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.normal, 
                  color: Color.fromARGB(255, 129, 129, 129)),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                child: ElevatedButton(
    style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return const Color.fromARGB(255, 11, 128, 98); // Fond vert au survol
        }
        return Colors.white; // background transparent
      },
    ),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return Colors.white; // Texte blanc au survol
        }
        return const Color.fromARGB(255, 11, 128, 98); // Texte vert normalement
      },
    ),
    shape: WidgetStateProperty.resolveWith<OutlinedBorder?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ); // Bordure supprimée au survol
        }
        return RoundedRectangleBorder(
          side: const BorderSide(
            color: Color.fromARGB(255, 11, 128, 98), // Bordure verte normalement
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        );
      },
    ),
    padding: WidgetStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20,
      ),
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  },
  child: const Text(
    "Démarrer",
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
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
