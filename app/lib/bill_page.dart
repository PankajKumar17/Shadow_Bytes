import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'home_page.dart';
import 'profile.dart';
import 'services/auth_service.dart';
import 'razorpay_button.dart';

class BillPage extends StatefulWidget {
  final String? scannedData;

  const BillPage({super.key, this.scannedData});

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final AuthService _authService = AuthService();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  double _walletBalance = 0.0;
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    _loadWalletBalance();
    _loadScannedProducts();
  }

  Future<void> _loadWalletBalance() async {
    final balanceStr = await _secureStorage.read(key: "wallet_balance");
    setState(() {
      _walletBalance = balanceStr != null ? double.parse(balanceStr) : 0.0;
    });
  }

  void _loadScannedProducts() {
    if (widget.scannedData != null) {
      try {
        String jsonlist = widget.scannedData!.replaceAll("'", "\"");
        final List<dynamic> products = jsonDecode(jsonlist);
        setState(() {
          items =
              products.map((product) {
                return {
                  "name": product['name'] ?? "Unknown Item",
                  "price": product['price'] ?? 0.0,
                };
              }).toList();
        });
      } catch (e) {
        debugPrint("❌ Error parsing scanned data: $e");
      }
    }
  }

  Future<void> _updateWalletBalance(double newBalance) async {
    await _secureStorage.write(
      key: 'wallet_balance',
      value: newBalance.toString(),
    );
    setState(() {
      _walletBalance = newBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = items.fold(0, (sum, item) => sum + item['price']);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bill Summary",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  var item = items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "₹${item['price']}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 1.5),
            Text(
              "Total: ₹$totalPrice",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () => _authenticateAndProceed(context, totalPrice),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Pay"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _generateInvoice(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Generate Invoice"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  void _authenticateAndProceed(BuildContext context, double totalPrice) async {
    bool authenticated = await _authService.authenticate();
    if (authenticated) {
      _showPaymentDialog(context, totalPrice);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Authentication Failed")));
    }
  }

  void _showPaymentDialog(BuildContext context, double totalPrice) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose Payment Method"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _handleOfflinePayment(context, totalPrice);
              },
              child: const Text("Offline Pay"),
            ),
            RazorpayButton(
              amount: (totalPrice * 100).toInt(),
              onPaymentSuccess: (paidAmount) {
                Navigator.pop(context);
                _updateWalletBalance(_walletBalance + paidAmount);
                setState(() {
                  items.clear();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Online Payment Successful")),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _handleOfflinePayment(BuildContext context, double totalPrice) {
    if (_walletBalance >= totalPrice) {
      double newBalance = _walletBalance - totalPrice;
      _updateWalletBalance(newBalance);
      setState(() {
        items.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Payment Successful! Remaining Wallet Balance: ₹$newBalance",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Insufficient Wallet Balance!")),
      );
    }
  }

  Future<void> _generateInvoice(BuildContext context) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                "Invoice",
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: ['Item Name', 'Price (₹)'],
                data:
                    items
                        .map((item) => [item['name'], item['price'].toString()])
                        .toList(),
              ),
              pw.Divider(),
              pw.Text(
                "Total: ₹${items.fold<int>(0, (sum, item) => sum + (item['price'] as num).toInt())}",
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );

    Uint8List pdfBytes = await pdf.save();
    await Printing.sharePdf(bytes: pdfBytes, filename: "invoice.pdf");
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WalletHomePage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BillPage()),
            );
            break;
          case 2:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("History Feature Coming Soon!")),
            );
            break;
          case 3:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
            break;
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
