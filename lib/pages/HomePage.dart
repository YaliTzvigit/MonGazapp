// Page d'accueil

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn1;
  late Animation<double> _fadeIn2;
  late Animation<double> _fadeIn3;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeIn1 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.4)),
    );
    _fadeIn2 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.3, 0.6)),
    );
    _fadeIn3 = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.6, 1.0)),
    );

    _controller.forward(); // Lancer les animations
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FadeTransition(
              opacity: _fadeIn1,
              child: const Column(
                children: [
                  SizedBox(height: 50),
                  Icon(
                    Icons.local_fire_department,
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
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Ne manquez jamais de gaz : surveillez le niveau de votre bouteille en temps réel.",
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
            ),

            // Bouton animé
            FadeTransition(
              opacity: _fadeIn2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 188, 105, 11),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/auth');
                },
                child: const Text(
                  "DEMARRER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Section bas
            FadeTransition(
              opacity: _fadeIn3,
              child: Container(
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
                        debugPrint("Lecture de la vidéo d'introduction...");
                      },
                      child: const Text(
                        "REGARDER NOTRE VIDEO D'INTRODUCTION",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold, // Texte en gras
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
