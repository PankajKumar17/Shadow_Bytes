import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(ScratchWinGame());
}

class ScratchWinGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratch & Win")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => GameScreen()));
              },
              child: Text("Play Game"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Rules"),
                    content: Text("Find the winning block within 5 tries to win ₹2!"),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
                  ),
                );
              },
              child: Text("Rules"),
            ),
          ],
        ),
      ),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int? winningIndex;
  int attempts = 0;
  int gameMoney = 0;
  List<bool> revealedBlocks = List.generate(25, (index) => false);
  final AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadGameMoney();
    _generateWinningIndex();
  }

  void _loadGameMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      gameMoney = prefs.getInt("gameMoney") ?? 0;
    });
  }

  void _updateGameMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("gameMoney", gameMoney);
  }

  void _generateWinningIndex() {
    setState(() {
      winningIndex = Random().nextInt(25);
    });
  }

  void _checkBlock(int index) {
    if (revealedBlocks[index] || attempts >= 5) return;
    
    setState(() {
      revealedBlocks[index] = true;
      attempts++;
      if (index == winningIndex) {
        gameMoney += 2;
        _updateGameMoney();
        player.play(AssetSource('win_sound.mp3'));
      } else if (attempts == 5) {
        player.play(AssetSource('loose_sound.mp3'));
      }
    });
  }

  void _resetGame() {
    setState(() {
      attempts = 0;
      revealedBlocks = List.generate(25, (index) => false);
      _generateWinningIndex();
    });
  }

  void _showAll() {
    setState(() {
      revealedBlocks = List.generate(25, (index) => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratch & Win")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Attempts: $attempts/5", style: TextStyle(fontSize: 18)),
                Text("Game Money: ₹$gameMoney", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              itemCount: 25,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _checkBlock(index),
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: revealedBlocks[index] ? (index == winningIndex ? Colors.green : Colors.red) : Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: revealedBlocks[index] && index == winningIndex
                          ? Icon(Icons.attach_money, color: Colors.white, size: 30)
                          : Text("", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _resetGame, child: Text("Reset")),
              ElevatedButton(onPressed: _showAll, child: Text("Show All")),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}