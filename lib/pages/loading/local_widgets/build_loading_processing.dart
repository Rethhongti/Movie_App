import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget buildLoadingProcessing() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCircle(
          color: Colors.red,
          size: 60.0,
        ),
        SizedBox(height: 10),
        Text(
          'កំពុងដំណើរការ...',
          style: TextStyle(
            fontFamily: 'KhmerOSbattambang',
          ),
        ),
      ],
    ),
  );
}
