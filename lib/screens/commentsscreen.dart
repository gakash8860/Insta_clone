import 'package:flutter/material.dart';
import 'package:insta_clone/utils/color.dart';
class CommentsScreen extends StatefulWidget {
  const CommentsScreen({ Key? key }) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Comment"),
        centerTitle: false,
      ),
      
    );
  }
}