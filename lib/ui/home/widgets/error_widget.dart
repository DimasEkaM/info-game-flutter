import 'package:flutter/material.dart';

class ErrorGameWidget extends StatelessWidget {
  const ErrorGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something was wrong',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}