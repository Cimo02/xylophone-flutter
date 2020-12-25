import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey({int note, Color color}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          playSound(note);
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB((note * 15.0), 0, 15, 10),
          child: Card(
            elevation: 5.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
                Icon(
                  Icons.circle,
                  color: Colors.white,
                ),
              ],
            ),
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildKey(note: 1, color: Colors.red[400]),
              buildKey(note: 2, color: Colors.orange[400]),
              buildKey(note: 3, color: Colors.yellow[400]),
              buildKey(note: 4, color: Colors.green[400]),
              buildKey(note: 5, color: Colors.lightBlue[300]),
              buildKey(note: 6, color: Colors.blue[600]),
              buildKey(note: 7, color: Colors.deepPurple[300]),
            ],
          ),
        ),
      ),
    );
  }
}
