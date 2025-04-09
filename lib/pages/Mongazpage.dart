import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MongazPage extends StatefulWidget {
  const MongazPage({super.key});

  @override
  State<MongazPage> createState() => _MongazPageState();
}

class _MongazPageState extends State<MongazPage>
    with SingleTickerProviderStateMixin {
  int gazLevel = 42;
  String status = "Normal";
  Color statusColor = Colors.green;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _showMenu = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    Future.delayed(const Duration(seconds: 3), _decreaseGasLevel);
  }

  void _decreaseGasLevel() {
    setState(() {
      if (gazLevel > 0) gazLevel -= 1;
      status = gazLevel <= 15
          ? "Critique"
          : gazLevel <= 30
              ? "Faible"
              : "Normal";
      statusColor = gazLevel <= 15
          ? Colors.red
          : gazLevel <= 30
              ? Colors.orange
              : Colors.green;
    });

    if (gazLevel > 0) {
      Future.delayed(const Duration(seconds: 3), _decreaseGasLevel);
    }
  }

  void _toggleMenu() {
    setState(() {
      _showMenu = !_showMenu;
      if (_showMenu) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '225 0788729838',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('Mon Gaz 🔥',
                style: TextStyle(fontWeight: FontWeight.bold)),
            IconButton(
              icon: const Icon(Icons.menu_sharp),
              onPressed: _toggleMenu,
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.local_gas_station,
                          size: 60, color: Colors.blueGrey),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          SizedBox(
                            width: 150,
                            child: LinearProgressIndicator(
                              value: gazLevel / 100,
                              minHeight: 10,
                              color: statusColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '$gazLevel%',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              status,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (gazLevel <= 15)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.notifications, color: Colors.red),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                                'Attention ! Votre gaz est presque vide. Pensez à commander.',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 28),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 11, 128, 98),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      if (kDebugMode) {
                        print('Passer une commande de gaz +');
                      }
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Passer une commande',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_showMenu)
            SlideTransition(
              position: _slideAnimation,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 400,
                  height: double.infinity,
                  color: const Color.fromARGB(255, 58, 58, 58),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Navigation',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 50),
                      ListTile(
                        leading: const Icon(Icons.login),
                        title: const Text(
                          "Se connecter",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                        contentPadding: EdgeInsets.zero,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text(
                          "Paramètres du compte",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                        contentPadding: EdgeInsets.zero,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text(
                          "Se déconnecter",
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {},
                        contentPadding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Version 1.0.0',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print('Instagram link.');
                                  }
                                },
                                child: const Text(
                                  "Instagram",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 94, 15),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            const SizedBox(width: 20),
                            GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print('Facebook link.');
                                  }
                                },
                                child: const Text(
                                  "Facebook",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 94, 15),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                            const SizedBox(width: 20),
                            GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print('Lien TikTok.');
                                  }
                                },
                                child: const Text(
                                  "Twitter",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 159, 94, 15),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
