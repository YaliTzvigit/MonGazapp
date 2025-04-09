import 'package:flutter/material.dart';
import 'auth.dart'; // Importe AboutPage

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Section supérieure avec icône et titre
            const Column(
              children: [
                SizedBox(height: 50),
                Icon(
                  Icons.local_fire_department, // Icône de flamme
                  size: 80,
                  color: Color.fromARGB(255, 11, 128, 98),
                ),
                SizedBox(height: 20),
                Text(
                  "Bienvenue sur MonGaz",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Pour suivre, facilement et en temps réel, le niveau de votre bouteille de gaz et savoir quand il est temps d’en acheter une nouvelle.",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400, 
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Bouton COMMENCER
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 188, 105, 11),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/auth'); // Navigation vers la page auth.dart
              },
              child: const Text(
                "COMMENCER",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Section en bas avec fond vert
            Container(
              color: const Color.fromARGB(255, 11, 128, 98),
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    onPressed: () {
                      // Logique pour lire la vidéo d'introduction
                      debugPrint("Lecture de la vidéo d'introduction...");
                    },
                    child: const Text(
                      "REGARDEZ NOTRE VIDEO D'INTRODUCTION",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
