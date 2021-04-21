import 'package:flutter/material.dart';

Widget buildAppBar(context){
  return AppBar(
    backgroundColor: Colors.black,
    leading: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    ),
  );
}