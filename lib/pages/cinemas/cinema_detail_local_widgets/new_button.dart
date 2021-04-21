import 'package:flutter/material.dart';
import 'package:movie/pages/cinemas/cinema_next.dart';

Widget nextButton(context){
  return Container(
    height: 80,
    width: double.infinity,
    // color: Colors.green,
    alignment: Alignment.center,
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CinemaNext()));
      },
      child: CircleAvatar(
        radius: 32,
        backgroundColor: Colors.red,
        child: Text('បន្ត', style: TextStyle(
          fontSize: 16,
          fontFamily: 'KhmerOSbattambang',
        ),),
      ),
    ),
  );
}