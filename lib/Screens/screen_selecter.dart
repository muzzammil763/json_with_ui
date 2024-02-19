import 'package:flutter/material.dart';
import 'package:json_with_ui/Screens/comments_screen.dart';
import 'package:json_with_ui/Screens/posts_screen.dart';

class ScreenSelecter extends StatelessWidget {
  const ScreenSelecter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[700],
        title: const Text(
          'JSON with UI',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
        child: Column(
          children: [
            Box(
              title: 'Posts Screen',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            Box(
              title: 'Comments Screen',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommentsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final String title;
  final Color? boxclr;
  final Color? textclr;
  final void Function()? onTap;
  //
  const Box({
    super.key,
    required this.title,
    this.boxclr,
    this.textclr,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 16,
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
