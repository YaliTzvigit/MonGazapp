import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final List<Widget> _pages = [
    const _WelcomePage(
      title: 'Bienvenue sur MonGaz',
      image: 'assets/images/gas.png', // Remplacez par le chemin réel
      description:
          'Une application pour gérer facilement votre approvisionnement en gaz.',
    ),
    const _WelcomePage(
      title: 'Suivi du niveau de gaz',
      image: 'assets/images/gas.png', // Remplacez par le chemin réel
      description:
          'Vérifiez en temps réel la quantité restante de gaz dans votre bouteille.',
      level: '50%', // Optionnel : pour afficher le niveau
    ),
    const _WelcomePage(
      title: 'Commande à domicile',
      image: 'assets/images/gas.png', // Remplacez par le chemin réel
      description: 'Commandez facilement des bouteilles de gaz chez vous.',
    ),
  ];

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String? level;

  const _WelcomePage({
    required this.title,
    required this.image,
    required this.description,
    this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Image.asset(image,
              height: 150), // Ajustez la hauteur selon vos besoins
          const SizedBox(height: 32),
          if (level != null)
            Text(
              level!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () {
              // Gérez l'action du bouton "Suivant" ici
              // Par exemple, passer à l'écran suivant ou un écran de connexion/inscription
            },
            child: const Text('Suivant'),
          ),
        ],
      ),
    );
  }
}
