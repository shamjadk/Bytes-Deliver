import 'package:bytes_deliver/main.dart';
import 'package:flutter/material.dart';

void showSnackBar(String message) {
  MyApp.scaffoldMessengerKey.currentState!
      .showSnackBar(SnackBar(content: Text(message)));
}
