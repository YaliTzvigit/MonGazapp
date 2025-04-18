import 'package:flutter/material.dart';
import 'package:gazap/pages/welcome.dart';
import 'pages/HomePage.dart'; // Importe HomePage
import 'pages/Mongazpage.dart'; // Importe AboutPage
import 'pages/auth.dart'; // Importe AboutPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome', // Route initiale (HomePage)
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/home': (context) => const HomePage(),
        '/mongaz': (context) => const MongazPage(),
        '/auth': (context) => const AuthPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Montserrat', // Applique la police Montserrat à l'ensemble de l'application
      ),
    );
  }
}
