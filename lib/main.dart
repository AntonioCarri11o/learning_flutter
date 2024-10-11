import 'package:flutter/material.dart';
import 'package:learning_flutter/navigation/home.dart';
import 'package:learning_flutter/navigation/navigation.dart';
import 'package:learning_flutter/navigation/profile.dart';
import 'package:learning_flutter/navigation/reservations.dart';
import 'package:learning_flutter/navigation/top.dart';
import 'package:learning_flutter/widgets/modules/auth/screens/login.dart';
import 'package:learning_flutter/widgets/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const Home(),
        '/top': (context) => const Top(),
        '/reservations': (context) => const Reservations(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
