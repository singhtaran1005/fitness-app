import 'dart:convert';

import 'package:fitness_app/screens/exercise.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiURl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";
  Exercise exercise;

  @override
  void initState() {
    getExercises();

    super.initState();
  }

  void getExercises() async {
    var response = await http.get(apiURl);
    var body = response.body;
    var decodejson = jsonDecode(body);
    exercise = Exercise.fromJson(decodejson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("FITNESS APP")),
      ),
      body: Center(
        child: Container(
          child: exercise != null
              ? ListView(
                  children: exercise.exercises.map((e) {
                    return Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: FadeInImage(
                              image: NetworkImage(e.thumbnail),
                              placeholder: AssetImage("assets/placeholder.jpg"),
                              width: MediaQuery.of(context).size.width,
                              height: 250.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF000000),
                                    Color(0xFF000000)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 250,
                            margin: EdgeInsets.only(left:10.0,bottom:20.0),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              e.title,
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
