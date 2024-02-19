import 'package:flutter/material.dart';

class ScreenSelecter extends StatelessWidget {
  const ScreenSelecter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent[700],
        title: const Text(
          'JSON with UI',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Column(
        children: [
          Box(
            title: 'Posts Screen',
          ),
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String title;
  final Color? boxclr;
  final Color? textclr;
  const Box({super.key, required this.title, this.boxclr, this.textclr});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 8,
        top: 8,
        right: 8,
      ),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: boxclr ?? Colors.blueAccent[700],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textclr ?? Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
