import 'package:flutter/material.dart';

Widget buildAppBar(BuildContext context){
  return AppBar(
    title: Text('LUXURY'),
    centerTitle: true,
    backgroundColor: Colors.black,
    leading: InkWell(
      child: Icon(Icons.arrow_back, color: Colors.white),
      onTap: (){
        Navigator.pop(context);
      },
    ),
  );
}