import 'dart:async';
import 'package:flutter/material.dart';

class MongazPage extends StatefulWidget {
  @override
  _MongazPage createState() => _MongazPage();
}

class _MongazPage extends State<MongazPage> {
  double gasLevel = 90;
  late Timer timer;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      setState(() {
        if (gasLevel > 0) {
          gasLevel -= 2;
          if (gasLevel < 0) gasLevel = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  String getStatusLabel(double level) {
    if (level > 45) return "Bon";
    if (level > 30) return "Normal";
    if (level > 15) return "Faible";
    if (level > 0) return "Critique";
    return "Vide";
  }

  Color getStatusColor(double level) {
    if (level > 45) return Colors.green;
    if (level > 30) return Colors.blue;
    if (level > 15) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final status = getStatusLabel(gasLevel);
    final statusColor = getStatusColor(gasLevel);

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.lightGreen),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("MonGaz",
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20)),
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Accueil"),
              onTap: () => Navigator.pushNamed(context, '/accueil'),
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Statistiques"),
              onTap: () => Navigator.pushNamed(context, '/statistiques'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Paramètres"),
              onTap: () => Navigator.pushNamed(context, '/parametres'),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Aide"),
              onTap: () => Navigator.pushNamed(context, '/aide'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Déconnexion"),
              onTap: () => Navigator.pushNamed(context, '/logout'),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xF0F9FFFA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) => MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => Scaffold.of(context).openDrawer(),
                        child: Image.asset('assets/icons/twobars.png', height: 24),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text("MonGaz", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department, color: Colors.black),
                    ],
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Stack(
                      children: [
                        Image.asset('assets/icons/user.png', height: 24),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bonjour!", style: TextStyle(color: Colors.grey[700])),
                  Text("Contrôler le niveau de votre gaz.",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Gas Icon + Gauge + % + Button: Flex display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/gas.png', height: 100),
                SizedBox(width: 20),
                Container(
                  height: 120,
                  width: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 120 * (gasLevel / 100),
                      width: 20,
                      color: statusColor,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${gasLevel.toInt()}%",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(status,
                        style: TextStyle(fontSize: 14, color: statusColor, fontWeight: FontWeight.w500)),
                    if (gasLevel <= 0) ...[
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 3, 145, 116),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding : const EdgeInsets.symmetric(horizontal: 25, vertical: 20)
                        ),
                        child: Text(
                          "Commander +",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]
                  ],
                )
              ],
            ),

            if (gasLevel <= 0) ...[
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning_sharp, color: Colors.red),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text("Attention, votre bouteille est presque vide. Commandez.",
                            style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            SizedBox(height: 30),

            // Statistiques
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("STATISTIQUES D'AUJOURD'HUI",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      Icon(Icons.bar_chart, size: 18),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text("85%", style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold)),
                            Text("Volume utilisé ", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text("3min:32s", style: TextStyle(fontSize: 20, color: Colors.teal, fontWeight: FontWeight.bold)),
                            Text("Temps d'utilisation", style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 30),

            // Historique d'utilisation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Historique récent", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.calendar_today, size: 20),
                          title: Text("07 Avril 2025"),
                          subtitle: Text("Durée : 4min - Conso : 8%"),
                        ),
                        Divider(height: 1),
                        ListTile(
                          leading: Icon(Icons.calendar_today, size: 20),
                          title: Text("06 Avril 2025"),
                          subtitle: Text("Durée : 5min - Conso : 10%"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Estimation de recharge
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange.shade200),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(Icons.schedule, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Estimation : Recharge recommandée dans 4 jours à ce rythme.",
                        style: TextStyle(color: Colors.orange[800]),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Feedback
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/feedback');
                },
                icon: Icon(Icons.feedback_outlined),
                label: Text("Donner un retour"),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/home.png',
                width: 28,
                height: 28,
                color: _selectedIndex == 0 ? Colors.lightGreen : Colors.grey,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/graph.png',
                width: 28,
                height: 28,
                color: _selectedIndex == 1 ? Colors.lightGreen : Colors.grey,
              ),
            ),
            label: "Historique",
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/help.png',
                width: 28,
                height: 28,
                color: _selectedIndex == 2 ? Colors.lightGreen : Colors.grey,
              ),
            ),
            label: "Aide",
          ),
          BottomNavigationBarItem(
            icon: Center(
              child: Image.asset(
                'assets/icons/user.png',
                width: 22,
                height: 22,
                color: _selectedIndex == 3 ? Colors.lightGreen : Colors.grey,
              ),
            ),
            label: "Mon espace",
          ),
        ],
      ),
    );
  }
}
