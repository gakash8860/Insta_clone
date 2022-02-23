import 'package:flutter/material.dart';
import 'package:insta_clone/screens/add_post.dart';

import '../screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItem = [
  FeedScreen(),
  Text('Search'),
  AddPostScreen(),
  Text('Notify'),
  Text('profile'),
];
