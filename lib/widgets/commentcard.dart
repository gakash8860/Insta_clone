import 'package:flutter/material.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/provider/userprovider.dart';
import 'package:provider/provider.dart';

class CommentCard extends StatefulWidget {
  // final snap
  const CommentCard({Key? key}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).getUser;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage( user!.photoUrl.toString())
           
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text:  TextSpan(children: [
                    TextSpan(
                        text: user.username.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    const TextSpan(
                        text: 'some description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      '04/03/2022',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(45),
            child: const Icon(
              Icons.favorite,
              size: 15,
            ),
          )
        ],
      ),
    );
  }
}
