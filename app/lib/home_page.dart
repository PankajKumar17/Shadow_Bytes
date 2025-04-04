import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'profile.dart';
import 'bill_page.dart';
import 'QRScannerPage.dart';
import 'scratch_win.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'razorpay_button.dart'; 
import 'history_page.dart';

class WalletHomePage extends StatefulWidget {
  const WalletHomePage({super.key});

  @override
  State<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends State<WalletHomePage> {
  String? _userName;
  int _selectedIndex = 0;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  double _walletBalance = 0.0;
  int _gameMoney = 0;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_name') ?? "User";
    int gameMoney = prefs.getInt('gameMoney') ?? 0;
    String? walletBalanceStr = await _secureStorage.read(key: 'wallet_balance');
    double walletBalance =
        walletBalanceStr != null ? double.parse(walletBalanceStr) : 0.0;

    setState(() {
      _userName = userName;
      _gameMoney = gameMoney;
      _walletBalance = walletBalance;
    });
  }

  Future<void> _addGameMoney(int amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int newGameMoney = _gameMoney + amount;
    await prefs.setInt('gameMoney', newGameMoney);
    setState(() {
      _gameMoney = newGameMoney;
    });
  }

  Future<void> _addMoney(double amount) async {
    setState(() {
      _walletBalance += amount;
    });
    await _secureStorage.write(
      key: "wallet_balance",
      value: _walletBalance.toString(),
    );
  }

  void _showAddMoneyDialog() {
    TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Money"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Enter Amount"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  int? enteredAmount = int.tryParse(amountController.text);
                  if (enteredAmount == null || enteredAmount <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid amount")),
                    );
                    return;
                  }

                  Navigator.pop(context); // Close dialog before opening Razorpay

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Confirm Payment"),
                        content: RazorpayButton(
                          amount: enteredAmount, // Pass the correct amount
                          onPaymentSuccess: (amount) {
                            _addMoney(amount);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  );
                },
                child: const Text("Pay with Razorpay"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _transferGameMoneyToWallet() async {
    if (_gameMoney <= 0) return;

    double newWalletBalance = _walletBalance + _gameMoney;

    await _secureStorage.write(
      key: "wallet_balance",
      value: newWalletBalance.toString(),
    );

    // Reset game money in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('gameMoney', 0);

    setState(() {
      _walletBalance = newWalletBalance;
      _gameMoney = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("₹$_gameMoney has been added to your wallet!")),
    );
  }

  void _showWinCashDialog() {
    if (_gameMoney <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No game money available to transfer.")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Transfer Game Money"),
          content: Text("Do you want to transfer ₹$_gameMoney to your wallet?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                _transferGameMoneyToWallet();
                Navigator.pop(context);
              },
              child: const Text("Transfer"),
            ),
          ],
        );
      },
    );
  }

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
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HistoryPage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BillPage()),
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
              _buildGameButtons(),
              const SizedBox(height: 20),
              _buildWalletSection(),
              const SizedBox(height: 20),
              Expanded(child: _buildMainActionButton(context)),
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
            Text(
              "Hello $_userName",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 20,
          child: Text(
            _userName != null && _userName!.isNotEmpty
                ? _userName![0].toUpperCase()
                : "A",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGameButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GameScreen()),
            );
            _loadUserData();
          },
          child: const Text("Play & Win"),
        ),
        ElevatedButton(
          onPressed: _showWinCashDialog,
          child: Text("Win Cash: ₹$_gameMoney"),
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
                children: [
                  const Icon(Icons.account_balance_wallet, color: Colors.white),
                  const SizedBox(width: 8),
                  Text(
                    "₹${_walletBalance.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _showAddMoneyDialog,
                child: const Text("+ Add Money"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainActionButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          String? scannedData = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QRScannerPage()),
          );

          if (scannedData != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BillPage(scannedData: scannedData),
              ),
            );
          }
        },
        child: Container(
          width: 200,
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
              Text(
                "Tap to scan",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
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
              const Text(
                "Notice Board",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: const Text("Show All")),
            ],
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset('assets/images/kurkure.webp', width: 60),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      "Hurry up! Grab the offer now",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}