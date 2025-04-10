// configurer les paramètres de l'appli

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double seuilAlerte = 20;
  bool notificationsActives = true;
  List<String> bouteilles = ["Bouteille 6kg", "Bouteille 12kg"];
  TextEditingController newBottleController = TextEditingController();

  void ajouterBouteille() {
    if (newBottleController.text.trim().isNotEmpty) {
      setState(() {
        bouteilles.add(newBottleController.text.trim());
        newBottleController.clear();
      });
    }
  }

  void supprimerBouteille(int index) {
    setState(() {
      bouteilles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⚙️ Paramètres"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // SEUIL D'ALERTE
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Seuil d’alerte (%)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Slider(
                      value: seuilAlerte,
                      onChanged: (value) => setState(() => seuilAlerte = value),
                      min: 5,
                      max: 100,
                      divisions: 19,
                      label: "${seuilAlerte.round()}%",
                      activeColor: Colors.redAccent,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined, color: Colors.grey),
                        const SizedBox(width: 8),
                        const Text(
                            "Recevoir un email si le niveau descend sous ce seuil"),
                        const Spacer(),
                        Switch(
                          value: notificationsActives,
                          onChanged: (value) =>
                              setState(() => notificationsActives = value),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // GESTION BOUTEILLES
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.gas_meter_outlined),
                        SizedBox(width: 8),
                        Text("Gestion des bouteilles",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ...bouteilles.asMap().entries.map((entry) {
                      int index = entry.key;
                      String bouteille = entry.value;
                      return ListTile(
                        title: Text(bouteille),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_forever,
                              color: Colors.red),
                          onPressed: () => supprimerBouteille(index),
                        ),
                      );
                    }),
                    const Divider(),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: newBottleController,
                            decoration: const InputDecoration(
                              hintText: "Nom de la nouvelle bouteille",
                            ),
                          ),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: ajouterBouteille,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // COMPTE UTILISATEUR
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Compte utilisateur"),
                subtitle: const Text("Connecté en tant que user@example.com"),
                trailing: TextButton.icon(
                  onPressed: () {
                    // TODO: Ajouter logique de déconnexion
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Déconnexion"),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
