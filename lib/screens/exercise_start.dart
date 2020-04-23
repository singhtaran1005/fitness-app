import 'package:fitness_app/screens/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;
  ExerciseStartScreen({this.exercises});
  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: widget.exercises.id,
        child: Image(
          image: NetworkImage(widget.exercises.thumbnail),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,         ),
      ),
    );
  }
}
