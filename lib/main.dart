import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'dart:math';

void main() {
  runApp(const TanyaDakuApp());
}

class TanyaDakuApp extends StatelessWidget {
  const TanyaDakuApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HalamanBola(),
    );
  }
}

class HalamanBola extends StatelessWidget {
  const HalamanBola({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          "Tanya Daku Apa Saja",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Bola(),
      backgroundColor: Colors.blue,
=======
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required int soundNumber, required Color buttonColor, required String buttonText}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        onPressed: () {
          print('Tombol $buttonText ditekan');
          playSound(soundNumber);
        },
        child: Text(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(soundNumber: 1, buttonColor: Colors.red, buttonText: 'Tombol 1'),
              buildKey(soundNumber: 2, buttonColor: Colors.orange, buttonText: 'Tombol 2'),
              buildKey(soundNumber: 3, buttonColor: Colors.yellow, buttonText: 'Tombol 3'),
              buildKey(soundNumber: 4, buttonColor: Colors.green, buttonText: 'Tombol 4'),
              buildKey(soundNumber: 5, buttonColor: Colors.teal, buttonText: 'Tombol 5'),
              buildKey(soundNumber: 6, buttonColor: Colors.blue, buttonText: 'Tombol 6'),
              buildKey(soundNumber: 7, buttonColor: Colors.purple, buttonText: 'Tombol 7'),
            ],
          ),
        ),
      ),
>>>>>>> 43de68a (prak04)
    );
  }
}

<<<<<<< HEAD
class Bola extends StatefulWidget {
  const Bola({Key? key});

  @override
  State<Bola> createState() => _BolaState();
}

class _BolaState extends State<Bola> {
  int nomorBola = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          int nomorRandom = Random().nextInt(5) + 1;
          print('Tombol ditekan - Nomor Bola: $nomorRandom');
          setState(() {
            nomorBola = nomorRandom;
          });
        },
        child: Image.asset(
          'images/ball$nomorBola.png',
        ),
      ),
    );
  }
}
=======



















>>>>>>> 43de68a (prak04)
