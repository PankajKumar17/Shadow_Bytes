import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import './pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, // Set primary color to blue
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Applies blue to buttons, app bar, etc.
        ),
        scaffoldBackgroundColor: Colors.white, // Set background color
      ),
      initialRoute: '/login',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const WalletHomePage(),
      },
    );
  }
}
