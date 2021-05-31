import 'package:flutter/material.dart';
import 'package:movie/pages/loading/loading.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/loading': (context) => Loading(),
      '/multiPages': (context) => MultiPages(),
    },
  ));
}
