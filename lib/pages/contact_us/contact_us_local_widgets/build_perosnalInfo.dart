import 'package:flutter/material.dart';

Widget buildPersonalInfo(){
  return Container(
    height: 380,
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Contact us', style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),),
            ],
          ),
          SizedBox(height: 25),
          Text('Get help and support, troubleshoot your', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),),
          SizedBox(height: 3),
          Text('services or get in touch with us', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),),
          SizedBox(height: 40),
          Text('Email', style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),),
          SizedBox(height: 4),
          Text('chheanbrosna101@gmail.com', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 40),
          Text('Phone Number', style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),),
          SizedBox(height: 4),
          Text('+855 93 65 15 13', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 40),
          Text('Address', style: TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),),
          SizedBox(height: 4),
          Text('PresBroSob Village, PresBroSob Commune,', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 2),
          Text('KhsachKondal District and Kandal Province', style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
    ),
  );
}