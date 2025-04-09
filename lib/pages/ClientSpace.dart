
/* L'Espace client */

import 'package:flutter/material.dart';

class EspaceClientPage extends StatelessWidget {
  const EspaceClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données utilisateur
    const String nom = "D. Blonde";
    const String email = "blonde@gmail.com";
    const String phone = "+225 07 00 00 00";
    const String statut = "Compte vérifié";
    final List<Map<String, dynamic>> bouteilles = [
      {"Nom": "Bouteille 12kg", "niveau": "65%", "date": "07 Avril 2025"},
      {"Nom": "Bouteille 6kg", "niveau": "30%", "date": "06 Avril 2025"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("👤 Mon Espace Client"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar + Infos perso
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/profile.jpg"), // ou NetworkImage
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nom, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(email),
                        Text(phone),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Statut du compte
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.verified_user, color: Colors.green),
                title: const Text("Statut du compte"),
                subtitle: Text(statut),
              ),
            ),
            const SizedBox(height: 20),

            // Bouteilles connectées
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.gas_meter_outlined, color: Colors.orange),
                        SizedBox(width: 10),
                        Text("Mes bouteilles connectées",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...bouteilles.map((b) => ListTile(
                          title: Text(b["nom"]),
                          subtitle: Text("Niveau : ${b["niveau"]} • Dernier relevé : ${b["date"]}"),
                          leading: const Icon(Icons.bubble_chart),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Boutons actions
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text("Modifier mon mot de passe"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Naviguer vers la page de changement de mot de passe
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text("Contacter le support"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // TODO: Rediriger vers la page de support ou envoyer un mail
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text("Déconnexion", style: TextStyle(color: Colors.red)),
                    onTap: () {
                      // TODO: Ajouter la logique de déconnexion
                    },
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
