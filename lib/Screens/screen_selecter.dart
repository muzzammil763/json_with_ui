import 'package:flutter/material.dart';
import 'package:json_with_ui/Screens/albums_screen.dart';
import 'package:json_with_ui/Screens/comments_screen.dart';
import 'package:json_with_ui/Screens/photos_screen.dart';
import 'package:json_with_ui/Screens/posts_screen.dart';
import 'package:json_with_ui/Screens/todos_screen.dart';
import 'package:json_with_ui/Screens/users_screen.dart';

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
        child: ListView(
          children: [
            Column(
              children: [
                Box(
                  boxclr: Colors.green,
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
                const SizedBox(
                  height: 8,
                ),
                Box(
                  boxclr: Colors.cyan,
                  title: 'Albums Screen',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AlbumsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Box(
                  boxclr: Colors.amberAccent,
                  textclr: Colors.black,
                  title: 'Photos Screen',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhotosScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Box(
                  boxclr: Colors.lightGreenAccent,
                  title: 'Todos Screen',
                  textclr: Colors.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodosScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Box(
                  boxclr: Colors.orange,
                  title: 'Users Screen',
                  textclr: Colors.black,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UsersScreen(),
                      ),
                    );
                  },
                ),
              ],
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
