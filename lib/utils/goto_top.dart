import 'package:flutter/material.dart';

void gotoTop(scrollController) {
  scrollController.animateTo(0.0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
}