import 'package:flutter/material.dart';
import '../../services/auth_service.dart'; // Import your AuthService

class BiometricAuthPage extends StatefulWidget {
  const BiometricAuthPage({super.key});

  @override
  _BiometricAuthPageState createState() => _BiometricAuthPageState();
}

class _BiometricAuthPageState extends State<BiometricAuthPage> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  Future<void> _authenticateUser() async {
    bool isAuthenticated = await _authService.authenticate();
    if (isAuthenticated) {
      // If authentication is successful, navigate to the main screen
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show a message and exit the app if authentication fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Authentication failed!")),
      );
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
