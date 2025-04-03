// import 'package:flutter/material.dart';
// import '../services/auth_service.dart'; // Import the auth service

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   final AuthService _authService = AuthService();

//   @override
//   void initState() {
//     super.initState();
//     _authenticateUser();
//   }

//   Future<void> _authenticateUser() async {
//     bool isAuthenticated = await _authService.authenticate();

//     if (isAuthenticated) {
//       Navigator.pushReplacementNamed(context, '/home'); // Go to Home if successful
//     } else {
//       Navigator.pushReplacementNamed(context, '/login'); // If failed, go to Login
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(), // Show loading until authentication is done
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import '../services/auth_service.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = await _authService.authenticate();

    if (isAuthenticated) {
      print("User authenticated! Navigating to Home.");
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print("Authentication failed! Navigating to Login.");
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show loading until authentication is done
      ),
    );
  }
}
