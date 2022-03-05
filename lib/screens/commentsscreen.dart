import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/resources/firestore_method.dart';
import 'package:insta_clone/utils/color.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/userprovider.dart';
import '../widgets/commentcard.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text("Comment"),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('post')
            .doc(widget.snap['postId'])
            .collection('comments')
            .snapshots(),
        builder: (context,  snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());

          }
          return ListView.builder(
            itemCount:(snapshot.data! as dynamic).docs.length ,
            itemBuilder: (context,index)=>const CommentCard());
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              Container(
                 color: Colors.red,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoUrl.toString()),
                  // radius: 18,
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 8, bottom: 14),
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                        helperText: "Comment as ${user.username.toString()}",
                        border: InputBorder.none),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await FireStoreMethods().postComment(
                      widget.snap['postId'],
                      commentController.text,
                      user.uid,
                      user.username,
                      user.photoUrl.toString());
                  commentController.clear();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    "Post ",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
