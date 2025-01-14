import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final String detail;

  const ErrorPage({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(detail,
         style: const TextStyle(color: Colors.red),),
      ),
    );
  }

}