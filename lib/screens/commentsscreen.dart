import 'package:flutter/material.dart';
import 'package:insta_clone/utils/color.dart';

import '../widgets/commentcard.dart';
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
body: CommentCard(),



        bottomNavigationBar: SafeArea(
          child: Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16,right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://static.india.com/wp-content/uploads/2021/09/urfi-javed.jpeg?impolicy=Medium_Widthonly&w=700&h=467'),
                radius: 18,

              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 8,bottom: 14),
                  child: TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      helperText: "Enter",
                      border: InputBorder.none
                    ),
                  
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                  child: const Text("Post ",style: TextStyle(
                    color: Colors.blueAccent
                  ),),
                ),
              )
            ],
          ),
          ),
        ),
    );
  }
}