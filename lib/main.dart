import 'package:flutter/material.dart';
import 'pages/HomePage.dart'; 
import 'pages/Mongazpage.dart';
import 'pages/auth.dart'; 
import 'pages/history.dart'; 
import 'pages/settings.dart'; 
import 'pages/HelpPage.dart'; 
import 'pages/ClientSpace.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mongaz', 
      routes: {
        /* '/home': (context) => const HomePage(), */
        '/mongaz': (context) =>  MongazPage(),
       /* '/auth': (context) => const AuthPage(),
        '/history': (context) => HistoriquePage(),
        '/settings': (context) => const SettingsPage(),
        '/help': (context) => const HelpPage(),
        '/clientspace' : (context) => const EspaceClientPage(), */
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Inter', 
      ),
    );
  }
}
