import 'package:flutter/material.dart';

class MongazPage extends StatefulWidget {
  const MongazPage({super.key});

  @override
  State<MongazPage> createState() => _MongazPage();
}

class _MongazPage extends State<MongazPage> {
  // Pourcentage de gaz restant
  double gasPercentage = 90; // Modifiable pour tester différents états

  // Fonction pour ouvrir le menu latéral (Drawer)
  void openMenu() {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // Déterminer l'état en fonction du pourcentage
    String gasStatus;
    Color statusColor;

    if (gasPercentage <= 15) {
      gasStatus = "Critique";
      statusColor = Colors.red;
    } else if (gasPercentage <= 45) {
      gasStatus = "Normal";
      statusColor = Colors.orange;
    } else {
      gasStatus = "Bon";
      statusColor = Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("MonGaz"),
        backgroundColor: const Color.fromARGB(255, 11, 128, 98),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: openMenu, // Ouvre le menu latéral
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200], // Couleur gris clair
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 111, 111, 111), // Couleur gris
              ),
              child: Text(
                "MonGaz",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 128, 98),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text("Paramètres du compte"),
              onTap: () {
                // Navigation ou action pour "Paramètres du compte"
                debugPrint("Paramètres cliqué !");
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.black),
              title: const Text("À propos"),
              onTap: () {
                // Navigation ou action pour "À propos"
                debugPrint("À propos cliqué !");
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.black),
              title: const Text("imb.tech@gmail.com"),
              onTap: () {
                // Ajoutez une action ici (comme envoyer un email)
                debugPrint("Email cliqué !");
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.black),
              title: const Text("(+225) 0788729838"),
              onTap: () {
                // Ajoutez une action ici (comme appeler un numéro)
                debugPrint("Téléphone cliqué !");
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.black),
              title: const Text("Instagram"),
              onTap: () {
                debugPrint("Instagram cliqué !");
              },
            ),
            ListTile(
              leading: const Icon(Icons.facebook, color: Colors.black),
              title: const Text("Facebook"),
              onTap: () {
                debugPrint("Facebook cliqué !");
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library, color: Colors.black),
              title: const Text("TikTok"),
              onTap: () {
                debugPrint("TikTok cliqué !");
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "MonGaz - v2.0.3. Tous droits réservés. 2025.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Niveau de gaz
            Text(
              "Niveau de Gaz : $gasPercentage%",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
            const SizedBox(height: 20),

            // État de gaz
            Text(
              "État : $gasStatus",
              style: TextStyle(
                fontSize: 20,
                color: statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),

            // Bouton et alerte pour état critique
            if (gasPercentage < 15) ...[
              Text(
                "Attention, votre bouteille est presque vide. Commandez.",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 11, 128, 98),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  debugPrint("Commande effectuée !");
                },
                child: const Text(
                  "Commander +",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: "Statistiques",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Paramètres",
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color.fromARGB(255, 11, 128, 98),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          debugPrint("Item sélectionné : $index");
        },
      ),
    );
  }
}
