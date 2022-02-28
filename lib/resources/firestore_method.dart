import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

//upload Post
  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profileImage) async {
    String res = "Some Error Occured";
    String postId = const Uuid().v1();
    try {
      String photoUrl =
          await StorageMethods().uploadImageToStorage("posts", file, true);
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          postId: postId,
          likes: [],
          datePublished: DateTime.now(),
          postUrl: photoUrl,
          profImage: profileImage);
      _fireStore.collection('posts').doc(postId).set(post.toJson());
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<void> likePost(String postId, String uId, List likes) async {
    try {
      if (likes.contains(uId)) {
       await  _fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uId])
        });
      } else {
      await  _fireStore.collection("posts").doc(postId).update({
          'likes': FieldValue.arrayUnion([uId]),
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
