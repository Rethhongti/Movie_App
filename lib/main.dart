import 'package:flutter/material.dart';
import 'package:movie/pages/cinemas/cinema_next.dart';
import 'package:movie/pages/contact_us/contact_us.dart';
import 'package:movie/pages/food_and_drink/food_and_drink.dart';
import 'package:movie/pages/food_and_drink/product_detail.dart';
import 'package:movie/pages/loading/loading.dart';
import 'package:movie/widgets/main_page.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/loading' : (context) => Loading(),
      '/multiPages' : (context) => MultiPages(),
    },
  ));
}
// void main() => runApp(Loading());

