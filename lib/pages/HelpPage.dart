
/* Centre d'aide */

import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('❓ Aide'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fonctionnement du capteur
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.sensors, color: Colors.blueAccent),
                        SizedBox(width: 10),
                        Text("Fonctionnement du capteur",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Le capteur est fixé sous la bouteille de gaz et mesure en temps réel le niveau de gaz restant. "
                      "Il communique via Bluetooth ou WiFi avec l'application Mongaz pour vous donner des alertes automatiques si le niveau devient trop bas.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Conseils d'utilisation
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.tips_and_updates, color: Colors.orange),
                        SizedBox(width: 10),
                        Text("Conseils d’utilisation",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "✔ Placez toujours la bouteille sur une surface plane.\n"
                      "✔ Ne déplacez pas la bouteille avec le capteur fixé.\n"
                      "✔ Vérifiez régulièrement le niveau sur l’app.\n"
                      "✔ Rechargez la batterie du capteur si nécessaire.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Contact support
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.support_agent, color: Colors.green),
                        SizedBox(width: 10),
                        Text("Support technique",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      "📧 Email : support@mongaz.com\n"
                      "📞 Téléphone : +225 07 00 00 00\n"
                      "🕒 Disponibilité : Lundi - Samedi (8h - 18h)",
                      style: TextStyle(fontSize: 15),
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
