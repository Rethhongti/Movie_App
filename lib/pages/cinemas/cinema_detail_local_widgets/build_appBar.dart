import 'package:flutter/material.dart';

Widget buildAppBar(context) {
  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: MediaQuery.of(context).size.width > 500 ? true : false,
    title: Container(
      child: Text('CINEMA', style: TextStyle(
        color: Colors.white,
      ),),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
  );
}
