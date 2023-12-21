import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;

  CustomSnackbar({required this.message});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
      duration: Duration(seconds: 3),
    );
  }
}