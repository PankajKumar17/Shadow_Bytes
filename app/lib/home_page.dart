// import 'package:flutter/material.dart';
// import 'profile.dart';

// class WalletHomePage extends StatefulWidget {
//   const WalletHomePage({super.key});

//   @override
//   State<WalletHomePage> createState() => _WalletHomePageState();
// }

// class _WalletHomePageState extends State<WalletHomePage> {
//   final String userName = "Dani Martinez";
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     if (_selectedIndex == index) return;

//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProfilePage()),
//       );
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
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Hello $userName", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       const Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     radius: 20,
//                     child: Text(
//                       userName[0],
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   gradient: const LinearGradient(
//                     colors: [Colors.blueAccent, Colors.cyan],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: const [
//                             Icon(Icons.account_balance_wallet, color: Colors.white),
//                             SizedBox(width: 8),
//                             Text("₹35,000", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
//                           ],
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: const Text("+ Add Money"),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Column(
//                         children: const [
//                           Icon(Icons.qr_code_scanner, size: 100, color: Colors.white),
//                           SizedBox(height: 10),
//                           Text("Tap to scan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'profile.dart';

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

//     if (index == 3) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProfilePage()),
//       );
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
//       body: SafeArea(
//         child: Center(
//           child: Text(
//             "Welcome to Wallet Home Page",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }



// ======================FINalProfileClicking


// import 'package:flutter/material.dart';
// import 'profile.dart';

// class WalletHomePage extends StatefulWidget {
//   const WalletHomePage({super.key});

//   @override
//   State<WalletHomePage> createState() => _WalletHomePageState();
// }

// class _WalletHomePageState extends State<WalletHomePage> {
//   final String userName = "Dani Martinez";
//   int _selectedIndex = 0;

// //  

// void _onItemTapped(int index) {
//   if (_selectedIndex == index) return;

//   setState(() {
//     _selectedIndex = index;
//   });

//   if (index == 0) {
//     // Navigate to HomePage (WalletHomePage)
//     Navigator.pushReplacementNamed(context, '/home');
//   } else if (index == 3) {
//     // Navigate to Profile Page
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const ProfilePage()),
//     );
//   }
// }



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
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Hello $userName", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                       const Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.blue,
//                     radius: 20,
//                     child: Text(
//                       userName[0],
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   gradient: const LinearGradient(
//                     colors: [Colors.blueAccent, Colors.cyan],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: const [
//                             Icon(Icons.account_balance_wallet, color: Colors.white),
//                             SizedBox(width: 8),
//                             Text("₹35,000", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
//                           ],
//                         ),
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: const Text("+ Add Money"),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     Center(
//                       child: Column(
//                         children: const [
//                           Icon(Icons.qr_code_scanner, size: 100, color: Colors.white),
//                           SizedBox(height: 10),
//                           Text("Tap to scan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'profile.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  final String userName = "Dani Martinez";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Bills'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildWalletSection(),
              const SizedBox(height: 20),
              Expanded(child: _buildMainActionButton(context)),
              _buildUtilityButtons(),
              _buildNoticeBoard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello $userName", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text("Welcome Back", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20,
          child: Text(
            userName[0],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildWalletSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.cyan],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.account_balance_wallet, color: Colors.white),
                  SizedBox(width: 8),
                  Text("₹35,000", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("+ Add Money"),
              ),
            ],
          ),
        ],
      ),
    );
  }

   Widget _buildMainActionButton(BuildContext context) {
    double noticeBoardWidth = MediaQuery.of(context).size.width * 0.9;
    return Center(
      child: Container(
        width: noticeBoardWidth,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, size: 80, color: Colors.black),
            SizedBox(height: 10),
            Text("Tap to scan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
      ),
    );
  }


  Widget _buildUtilityButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildUtilityButton(Icons.account_balance_wallet, "Add Money"),
          _buildUtilityButton(Icons.account_balance, "Check Balance"),
        ],
      ),
    );
  }

  Widget _buildUtilityButton(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(height: 5),
        Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildNoticeBoard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Notice Board", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              TextButton(onPressed: () {}, child: const Text("Show All")),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset('assets/offer.png', width: 60),
                  const SizedBox(width: 10),
                  const Expanded(child: Text("Hurry up! Grab the offer now", style: TextStyle(fontSize: 14))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}