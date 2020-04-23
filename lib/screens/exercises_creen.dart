import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_app/screens/exercise.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ExerciseScreen extends StatefulWidget {
  final Exercises exercises;
  final int seconds;
  ExerciseScreen({this.exercises, this.seconds});
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool isCompleted = false;
  int _elapsedseconds = 0;
  Timer timer;
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      (t) {
        if (t.tick == widget.seconds) {
          t.cancel();
          setState(() {
            isCompleted = true;
          });
          playAudio();
        }
        setState(
          () {
            _elapsedseconds = t.tick;
          },
        );
      },
    );
    super.initState();
  }

  void playAudio() {
    audioCache.play("cheering.wav");
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: NetworkImage(widget.exercises.gif),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          isCompleted != true
              ? SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text('$_elapsedseconds/${widget.seconds} S'),
                  ),
                )
              : Container(),
          SafeArea(
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
