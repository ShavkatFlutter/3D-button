import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  int count = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Pushable 3D button', style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                      offset: Offset(-5, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text("Push buttons and count", style: TextStyle(fontSize: 20),),
                    Text("$count", style: const TextStyle(fontSize: 30),),
                  ],
                ),
              ),
              Button(
                text: const Text(
                  'Increment',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  setState(() {
                    count++;
                  });
                },
                color: Colors.blue,
              ),
              SizedBox(height: 20),
              Button(
                text: const Text("Decrement", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),),
                onTap: (){
                  setState(() {
                    count--;
                  });
                },
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
