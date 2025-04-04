import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home_page.dart';
import 'bill_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  String _userName = "User"; // Default value
  String _profileImagePath = 'assets/profile.jpg'; // Default profile image

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_name') ?? "User";

    setState(() {
      _userName = userName;
      // If you plan to allow users to upload a profile picture, fetch it from secure storage.
    });
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.lightBlueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProfileHeader(),
                  _buildSettingsCard(),
                ],
              ),
            ),
          ),
          _buildHelpSection(), // Placed at the bottom
        ],
      ),
    ),
    bottomNavigationBar: _buildBottomNavigationBar(context),
  );
}

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "My Profile,",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 80,
            child: Text(
              _userName != null && _userName!.isNotEmpty
                  ? _userName![0].toUpperCase()
                  : "A",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            _userName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSettingsCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildSettingsOption(Icons.dark_mode, 'Dark Mode'),
            _buildSettingsOption(Icons.payment, 'Payment Methods'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(IconData icon, String title) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  Widget _buildHelpSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Help', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHelpOption('FAQs'),
              _buildHelpOption('Support'),
              _buildHelpOption('Privacy Policy'),
              _buildHelpOption('Terms & Conditions'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpOption(String title) {
    return InkWell(
      onTap: () {},
      child: Text(
        title,
        style: const TextStyle(color: Colors.blue, fontSize: 12),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 3, // Profile is selected
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WalletHomePage()),
          );
        }
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BillPage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Bills'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
