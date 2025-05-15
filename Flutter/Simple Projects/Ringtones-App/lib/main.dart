import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(Music());
}

class Music extends StatelessWidget {
  final player = AudioPlayer();

  void playMusic(int musicNumber) {
    player.stop();

    player.setAsset('Assets/music-$musicNumber.mp3').then((_) => player.play());
  }

  Expanded myButton(String text, Color color, int musicNumber) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: () {
            playMusic(musicNumber);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),

            child: Row(
              children: [
                Icon(Icons.music_note, color: color, size: 30),
                SizedBox(width: 20),
                Text(text, style: TextStyle(color: color, fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[300],
        appBar: AppBar(
          title: Text('My Music App'),
          backgroundColor: Colors.purple,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            myButton('Samsung Galaxy', Colors.red, 1),
            myButton('iPhone', Colors.black, 2),
            myButton('WhatsApp', Colors.green, 3),
            myButton('Nokia', Colors.blue, 4),
            myButton('LG', Colors.black, 5),
            myButton('Oppo', Colors.orange, 6),
            myButton('STC', Colors.pink, 7),
          ],
        ),
      ),
    );
  }
}
