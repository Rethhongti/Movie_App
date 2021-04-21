import 'package:flutter/material.dart';
import 'package:movie/utils/launch_url.dart';

Widget buildSetMessage(){
  return Container(
    margin: EdgeInsets.only(top: 10),
    height: 45,
    width: double.infinity,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.red,
      onPressed: (){
        launchURL('mailto:chheanbrosna3401@gmail.com');
      },
      child: Text('ផ្ញើសារ', style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'KhmerOSbattambang',
      ),),
    ),
  );
}