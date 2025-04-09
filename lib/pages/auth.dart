/* S'authentifier ici */

import 'package:flutter/material.dart';
import 'package:gazap/pages/Mongazpage.dart'; // Vers la page MongazPage

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void navigateToMonGazPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MongazPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: const Color(0xfff0fefb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "MonGaz 🔥",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),
              const Text(
                "Connectez-vous à votre compte.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),

              // Onglets Connexion / Inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => isLogin = true),
                    child: Text(
                      "Connexion",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isLogin ? Colors.black : Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("|"),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => isLogin = false),
                    child: Text(
                      "Inscription",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isLogin ? Colors.grey : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Formulaire
              if (!isLogin)
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Votre nom',
                    border: OutlineInputBorder(),
                  ),
                ),
              if (!isLogin) const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: '(+225) | Numéro de Téléphone',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              // Bouton
              Center(
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 400, // Largeur maximale
                  ),
                  child: ElevatedButton(
                    onPressed: navigateToMonGazPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      isLogin ? "Me connecter" : "M'inscrire",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              if (isLogin)
                GestureDetector(
                  onTap: () => setState(() => isLogin = false),
                  child: const Text(
                    "Nouveau/elle ? Crée ton compte",
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
