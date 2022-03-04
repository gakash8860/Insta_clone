import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  // final snap
  const CommentCard({ Key? key }) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 19,horizontal: 16),
  
      child: Row(
        children: [
          CircleAvatar(
     backgroundImage: NetworkImage('https://static.india.com/wp-content/uploads/2021/09/urfi-javed.jpeg?impolicy=Medium_Widthonly&w=700&h=467'),
                radius: 18,

          ),
          Expanded(
            child: Padding(padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'username',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                       TextSpan(
                        text: 'some description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ]
                  )
                  ),
                  Padding(padding: const EdgeInsets.only(top: 4),
                  
                  child: Text('04/03/2022',
                  
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
            child: Icon(Icons.favorite,size: 15,),
          )
        ],
      ),
  
    );
  }
}