import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan[700],

        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('Images/Mohammad.png'),
              ),

              Text(
                'Mohammad',
                style: TextStyle(
                  fontFamily: 'Sen',
                  fontSize: 38,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Flutter Programmer',
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                width: 300,
                height: 20,
                child: Divider(color: Colors.cyan[100], thickness: 1),
              ),

              Card(
                margin: EdgeInsets.all(10),

                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.cyan[700]),
                  title: Text(
                    '+972 54 3812415',
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),

                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.cyan[700]),
                  title: Text(
                    'mohammadahmadwork@gmail.com',
                    style: TextStyle(fontSize: 17, color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
