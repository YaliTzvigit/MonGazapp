import 'package:flutter/material.dart';
import 'package:gazap/pages/about.dart';
import 'package:gazap/pages/feedback.dart';
import 'package:gazap/pages/logout.dart';
import 'package:gazap/pages/notifs.dart';
import 'package:gazap/pages/policy.dart';
import 'package:gazap/pages/resetpasswd.dart';
import 'pages/HomePage.dart'; 
import 'pages/Mongazpage.dart';
import 'pages/auth.dart'; 
import 'pages/history.dart'; 
import 'pages/settings.dart'; 
import 'pages/HelpPage.dart'; 
import 'pages/ClientSpace.dart'; 
import 'pages/CommandPage.dart';
import 'pages/ErrorPage.dart';

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
        '/auth': (context) =>  AuthPage(),
        '/history': (context) => HistoriquePage(),
        '/settings': (context) =>  SettingsPage(),
        '/help': (context) =>  HelpPage(),
        '/clientspace' : (context) =>  EspaceClientPage(), 
        '/error': (context) =>  ErrorPage(),
        '/CommandPage' : (context) =>  CommandePage(),
        '/resetpage' : (context) => ResetPasswordPage(),
        '/feedback' : (context) => FeedbackPage(),
        '/notif' : (context) => notifPage(),
        '/logout' : (context) => LogoutPage(),
        '/about' : (context) => AboutPage(),
        '/policy' : (context) => PolicyPage(),
      },
      onGenerateRoute: (settings) {
         return MaterialPageRoute(builder: (context) => ErrorPage()); // Page d'erreur
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily:
            'Inter', 
      ),
    );
  }
}
