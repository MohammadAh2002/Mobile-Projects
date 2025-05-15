import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text('Cards Match', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.indigo[800],
        ),

        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int LeftImageNumber = 1, RightImagesNumber = 2;

  void ChangeImage() {
    LeftImageNumber = Random().nextInt(9) + 1;
    RightImagesNumber = Random().nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Text(
          LeftImageNumber == RightImagesNumber ? 'You Won' : 'Try Again',
          style: TextStyle(fontSize: 50, color: Colors.white),
        ),

        Padding(
          padding: const EdgeInsets.all(10),

          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ChangeImage();
                    });
                  },
                  child: Image.asset('Images/image-$LeftImageNumber.png'),
                ),
              ),

              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      ChangeImage();
                    });
                  },
                  child: Image.asset('Images/image-$RightImagesNumber.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
