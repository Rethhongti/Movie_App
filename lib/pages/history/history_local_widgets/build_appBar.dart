import 'package:flutter/material.dart';
import 'package:movie/pages/movies/movie.dart';

Widget buildAppBar(context){
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.black,
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        movieScreenKey.currentState.setState(() {
        });
        Navigator.pop(context);
      },
    ),
    title: Text(
      'HISTORY',
      style: TextStyle(color: Colors.white),
    ),
  );
}