import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Jokenpo());
}

class Jokenpo extends StatefulWidget {
  @override
  _Jokenpo createState() => _Jokenpo();
}

class _Jokenpo extends State<Jokenpo> {
  String _imgUserPlayer = 'images/indefinido.png';
  String _imgBotPlayer = 'images/indefinido.png';

  Color _borderUser = Colors.transparent;
  Color _borderBot = Colors.transparent;

  int _userPoints = 0;
  int _botPoints = 0;
  int _tied = 0;

  String _choiceBot() {
    var options = ['pedra', 'papel', 'tesoura'];
    String selected = options[Random().nextInt(3)];
    return selected;
  }

  void _play(userOption) {
    String botOption = _choiceBot();

    setState(() {
      _imgUserPlayer = 'images/$userOption.png';
      _imgBotPlayer = 'images/$botOption.png';
    });

    _resultGame(userOption, botOption);
  }

  String _controllerChoice(userOption, botOption) {
    if (userOption == botOption) {
      return 'empate';
    }

    if (userOption == 'pedra') {
      if (botOption == 'tesoura') {
        return 'ganhou';
      } else {
        return 'perdeu';
      }
    }
    if (userOption == 'tesoura') {
      if (botOption == 'papel') {
        return 'ganhou';
      } else {
        return 'perdeu';
      }
    }
    if (userOption == 'papel') {
      if (botOption == 'pedra') {
        return 'ganhou';
      } else {
        return 'perdeu';
      }
    }
  }

  void _resultGame(userOption, botOption) {
    var result = 'indefinido';

    result = _controllerChoice(userOption, botOption);

    setState(() {
      if (result == 'ganhou') {
        _userPoints++;
        _borderUser = Colors.green;
        _borderBot = Colors.transparent;
      } else if (result == 'perdeu') {
        _botPoints++;
        _borderUser = Colors.transparent;
        _borderBot = Colors.green;
      } else {
        _tied++;
        _borderUser = Colors.yellow;
        _borderBot = Colors.yellow;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pedra, Papel, Tesoura'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                "Disputa",
                style: TextStyle(fontSize: 26),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: _borderUser),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        _imgUserPlayer,
                        height: 120,
                      ),
                    ),
                    Text('Você'),
                  ],
                ),
                Text("vs"),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: _borderBot),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        _imgBotPlayer,
                        height: 120,
                      ),
                    ),
                    Text('Bot'),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text('Placar'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Você"),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(35),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        '$_userPoints',
                        style: TextStyle(fontSize: 26),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Empate'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(35),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        '$_tied',
                        style: TextStyle(fontSize: 26),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text('Bot'),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(35),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        '$_botPoints',
                        style: TextStyle(fontSize: 26),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text('Placar'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => _play('pedra'),
                  child: Image.asset(
                    'images/pedra.png',
                    height: 90,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play('papel'),
                  child: Image.asset(
                    'images/papel.png',
                    height: 90,
                  ),
                ),
                GestureDetector(
                  onTap: () => _play('tesoura'),
                  child: Image.asset(
                    'images/tesoura.png',
                    height: 90,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
