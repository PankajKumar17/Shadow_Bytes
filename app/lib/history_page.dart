import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


// Model for Transaction
class TransactionModel {
  final String id;
  final double amount;
  final String description;
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.description,
    required this.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['_id'],
      amount: json['amount'].toDouble(),
      description: json['description'] ?? 'No description',
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
   final _secureStorage = const FlutterSecureStorage();
  List<TransactionModel> transactions = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchTransactionHistory();
  }

  Future<void> fetchTransactionHistory() async {
    try {
      // Get token from secure storage
      String? token = await _secureStorage.read(key: 'auth_token');

      if (token == null) {
        setState(() {
          errorMessage = 'No auth token found!';
          isLoading = false;
        });
        return;
      }

      final response = await http.get(
        Uri.parse('http://localhost:5000/api/malls/history'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          transactions = data.map((json) => TransactionModel.fromJson(json)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to fetch history';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error: ${error.toString()}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction History')),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage, style: TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return ListTile(
                      title: Text('₹${transaction.amount.toStringAsFixed(2)}'),
                      subtitle: Text(transaction.description),
                      trailing: Text(
                        '${transaction.createdAt.day}/${transaction.createdAt.month}/${transaction.createdAt.year}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                ),
    );
  }
}
