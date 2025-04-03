// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const ProfilePage(),
//     );
//   }
// }

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   bool isNotificationEnabled = true;
//   bool isDarkModeEnabled = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black54,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Bills'),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.white, Colors.lightBlueAccent],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back),
//                       onPressed: () {},
//                     ),
//                   ),
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/profile.jpg'),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Dani Martinez',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildInfoCard(),
//                   const SizedBox(height: 10),
//                   _buildSettingsCard(),
//                   const SizedBox(height: 10),
//                   _buildHelpSection(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }





//   Widget _buildInfoCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text('Contact Details', style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text('Mobile No.:', style: TextStyle(color: Colors.black54)),
//             Text('Address:', style: TextStyle(color: Colors.black54)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
//             SwitchListTile(
//               title: const Text('Allow Notifications'),
//               value: isNotificationEnabled,
//               onChanged: (value) {
//                 setState(() => isNotificationEnabled = value);
//               },
//             ),
//             SwitchListTile(
//               title: const Text('Dark Mode'),
//               value: isDarkModeEnabled,
//               onChanged: (value) {
//                 setState(() => isDarkModeEnabled = value);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.payment),
//               title: const Text('Payment Methods'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHelpSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Help', style: TextStyle(fontWeight: FontWeight.bold)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('FAQs', style: TextStyle(color: Colors.blue)),
//               Text('Privacy Policy', style: TextStyle(color: Colors.blue)),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('Support', style: TextStyle(color: Colors.blue)),
//               Text('Terms & Conditions', style: TextStyle(color: Colors.blue)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, '/home');
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.white, Colors.lightBlueAccent],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/profile.jpg'),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Dani Martinez',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildInfoCard(),
//                   const SizedBox(height: 10),
//                   _buildSettingsCard(),
//                   const SizedBox(height: 10),
//                   _buildHelpSection(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text('Contact Details', style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text('Mobile No.:', style: TextStyle(color: Colors.black54)),
//             Text('Address:', style: TextStyle(color: Colors.black54)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
//             ListTile(
//               leading: const Icon(Icons.payment),
//               title: const Text('Payment Methods'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHelpSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Help', style: TextStyle(fontWeight: FontWeight.bold)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('FAQs', style: TextStyle(color: Colors.blue)),
//               Text('Privacy Policy', style: TextStyle(color: Colors.blue)),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('Support', style: TextStyle(color: Colors.blue)),
//               Text('Terms & Conditions', style: TextStyle(color: Colors.blue)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }





// ++++++++++


// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Center(
//         child: const Text(
//           "Profile Page",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }


// FINAL


// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pushReplacementNamed(context, '/home');
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.white, Colors.lightBlueAccent],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/profile.jpg'),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     'Dani Martinez',
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   _buildInfoCard(),
//                   const SizedBox(height: 10),
//                   _buildSettingsCard(),
//                   const SizedBox(height: 10),
//                   _buildHelpSection(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text('Contact Details', style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text('Mobile No.:', style: TextStyle(color: Colors.black54)),
//             Text('Address:', style: TextStyle(color: Colors.black54)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
//             ListTile(
//               leading: const Icon(Icons.payment),
//               title: const Text('Payment Methods'),
//               trailing: const Icon(Icons.arrow_forward_ios),
//               onTap: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHelpSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Help', style: TextStyle(fontWeight: FontWeight.bold)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('FAQs', style: TextStyle(color: Colors.blue)),
//               Text('Privacy Policy', style: TextStyle(color: Colors.blue)),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text('Support', style: TextStyle(color: Colors.blue)),
//               Text('Terms & Conditions', style: TextStyle(color: Colors.blue)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


// UI Code

// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.lightBlueAccent],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               _buildProfileHeader(),
//               _buildInfoCard(),
//               _buildSettingsCard(),
//               _buildHelpSection(),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: _buildBottomNavigationBar(),
//     );
//   }

//   Widget _buildProfileHeader() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         children: const [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Text(
//               "My Profile,",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(height: 10),
//           CircleAvatar(
//             radius: 50,
//             backgroundImage: AssetImage('assets/profile.jpg'),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Dani Martinez',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text('Contact Details', style: TextStyle(fontWeight: FontWeight.bold)),
//             SizedBox(height: 8),
//             Text('Mobile No.: +1 234 567 890', style: TextStyle(color: Colors.black54)),
//             Text('Address: 1234 Elm Street, Springfield, USA', style: TextStyle(color: Colors.black54)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsCard() {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
//             _buildSettingsOption(Icons.notifications, 'Allow Notifications'),
//             _buildSettingsOption(Icons.dark_mode, 'Dark Mode'),
//             _buildSettingsOption(Icons.payment, 'Payment Methods'),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSettingsOption(IconData icon, String title) {
//     return InkWell(
//       onTap: () {},
//       child: ListTile(
//         leading: Icon(icon),
//         title: Text(title),
//         trailing: const Icon(Icons.arrow_forward_ios),
//       ),
//     );
//   }

//   Widget _buildHelpSection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('Help', style: TextStyle(fontWeight: FontWeight.bold)),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _buildHelpOption('FAQs'),
//               _buildHelpOption('Support'),
//               _buildHelpOption('Privacy Policy'),
//               _buildHelpOption('Terms & Conditions'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHelpOption(String title) {
//     return InkWell(
//       onTap: () {},
//       child: Text(title, style: const TextStyle(color: Colors.blue, fontSize: 12)),
//     );
//   }

//   Widget _buildBottomNavigationBar() {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//         BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Bills'),
//         BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'home_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildInfoCard(),
              _buildSettingsCard(),
              _buildHelpSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "My Profile,",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile.jpg'),
          ),
          SizedBox(height: 10),
          Text(
            'Dani Martinez',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Contact Details', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Mobile No.: +1 234 567 890', style: TextStyle(color: Colors.black54)),
            Text('Address: 1234 Elm Street, Springfield, USA', style: TextStyle(color: Colors.black54)),
          ],
        ),
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
            const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
            _buildSettingsOption(Icons.notifications, 'Allow Notifications'),
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
      child: Text(title, style: const TextStyle(color: Colors.blue, fontSize: 12)),
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
          // Navigate to Home (WalletHomePage)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WalletHomePage()),
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
