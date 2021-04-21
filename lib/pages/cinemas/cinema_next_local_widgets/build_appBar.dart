import 'package:flutter/material.dart';

Widget buildAppBar(BuildContext context){
  return AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Text('បញ្ចាក់ប្រតិបត្តិការ', style: TextStyle(
      fontSize: 16,
      fontFamily: 'KhmerOSbattambang',
    ),),
    leading: InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back),
    ),
  );
}