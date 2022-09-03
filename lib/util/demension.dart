import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/add_post_screen.dart';
import 'package:instagram/screens/feed-screen.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/search_screen.dart';

const webScreenSize = 600;
List<Widget> homescreenitems = [
  const feedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  Text('notification'),
  profileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
