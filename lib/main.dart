import 'package:flutter/material.dart';
import 'pages/HomePage.dart'; // Importe HomePage
import 'pages/Mongazpage.dart'; // Importe AboutPage
import 'pages/auth.dart'; // Importe AboutPage
import 'pages/history.dart'; // Importe AboutPage
import 'pages/settings.dart'; // Importe AboutPage
import 'pages/HelpPage.dart'; // Importe AboutPage
import 'pages/ClientSpace.dart'; // Importe AboutPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // Route initiale (HomePage)
      routes: {
        '/home': (context) => const HomePage(),
        '/mongaz': (context) => const MongazPage(),
        '/auth': (context) => const AuthPage(),
        '/history': (context) => HistoriquePage(),
        '/settings': (context) => const SettingsPage(),
        '/help': (context) => const HelpPage(),
        '/clientspace' : (context) => const EspaceClientPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Nunito', 
      ),
    );
  }
}
