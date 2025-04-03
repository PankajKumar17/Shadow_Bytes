// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_Page.dart';
// import 'home_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }

// class MyApp extends StatelessWidget{
//   final bool isLoggedIn;
//   const MyApp({super.key, required this.isLoggedIn});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: isLoggedIn ? WalletHomePage() : LoginPage(),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'profile.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/home',
//       routes: {
//         '/home': (context) => const WalletHomePage(),
//         '/profile': (context) => const ProfilePage(),
//       },
//     );
//   }
// }

// class WalletHomePage extends StatefulWidget {
//   const WalletHomePage({super.key});

//   @override
//   State<WalletHomePage> createState() => _WalletHomePageState();
// }

// class _WalletHomePageState extends State<WalletHomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     if (_selectedIndex == index) return;

//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/home');
//         break;
//       case 3:
//         Navigator.pushReplacementNamed(context, '/profile');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black54,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Bills'),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//       body: Center(
//         child: Text(
//           'Welcome to Wallet Home Page',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }


// ++++++++++++++ FINALE

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';
// import 'home_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }

// class MyApp extends StatelessWidget {
//   final bool isLoggedIn;
//   const MyApp({super.key, required this.isLoggedIn});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: isLoggedIn ? '/home' : '/login',
//       routes: {
//         '/login': (context) => LoginPage(),
//         '/home': (context) => const WalletHomePage(),
//       },
//     );
//   }
// }

// ===================hFINALE

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:local_auth/local_auth.dart';
// import 'login_page.dart';
// import 'home_page.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   runApp(MyApp(isLoggedIn: isLoggedIn));
// }

// class MyApp extends StatefulWidget {
//   final bool isLoggedIn;
//   const MyApp({super.key, required this.isLoggedIn});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final LocalAuthentication auth = LocalAuthentication();
//   bool _isAuthenticated = false;

//   @override
//   void initState() {
//     super.initState();
//     _authenticateUser(); // Trigger biometric authentication
//   }

//   Future<void> _authenticateUser() async {
//     if (widget.isLoggedIn) {
//       bool authenticated = await auth.authenticate(
//         localizedReason: 'Authenticate to access the app',
//         options: const AuthenticationOptions(
//           biometricOnly: true,
//           stickyAuth: true,
//         ),
//       );
//       if (authenticated) {
//         setState(() {
//           _isAuthenticated = true;
//         });
//       }
//     } else {
//       setState(() {
//         _isAuthenticated = true; // Skip biometric for non-logged-in users
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isAuthenticated) {
//       return const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: Center(child: CircularProgressIndicator()), // Show loading until auth completes
//         ),
//       );
//     }

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: widget.isLoggedIn ? '/home' : '/login',
//       routes: {
//         '/login': (context) => LoginPage(),
//         '/home': (context) => const WalletHomePage(),
//       },
//     );
//   }
// }


// ===============hFinale2



// ============hFinale3



// import 'package:flutter/material.dart';

// import 'login_page.dart';
// import 'home_page.dart';
// import './pages/splash_screen.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/splash', 
//       routes: {
//         '/splash': (context) => SplashScreen(),
//         '/login': (context) => LoginPage(),
//         '/home': (context) => const WalletHomePage(),
//       },
//     );
//   }
// }




import 'package:flutter/material.dart';

import 'login_page.dart';
import 'home_page.dart';
import './pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/home': (context) => const WalletHomePage(),
      },
    );
  }
}
