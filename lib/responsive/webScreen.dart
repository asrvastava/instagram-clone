// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/models/user.dart' as model;
import 'package:instagram/provider/user_provider.dart';
import 'package:instagram/util/demension.dart';
import 'package:provider/provider.dart';

import '../util/colors.dart';

class webscreenlayout extends StatefulWidget {
  const webscreenlayout({Key? key}) : super(key: key);

  @override
  State<webscreenlayout> createState() => _webscreenlayoutState();
}

class _webscreenlayoutState extends State<webscreenlayout> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  // ignore: unused_element
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          centerTitle: false,
          title: SvgPicture.asset(
            'assets/ic_instagram.svg',
            color: primaryColor,
            height: 32,
          ),
          actions: [
            IconButton(
              onPressed: () => navigationTapped(0),
              icon: Icon(
                Icons.home,
                color: _page == 0 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTapped(1),
              icon: Icon(
                Icons.search,
                color: _page == 1 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTapped(2),
              icon: Icon(Icons.add_a_photo,
                  color: _page == 2 ? primaryColor : secondaryColor),
            ),
            IconButton(
              onPressed: () => navigationTapped(3),
              icon: Icon(
                Icons.favorite,
                color: _page == 0 ? primaryColor : secondaryColor,
              ),
            ),
            IconButton(
              onPressed: () => navigationTapped(4),
              icon: Icon(
                Icons.person,
                color: _page == 0 ? primaryColor : secondaryColor,
              ),
            )
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: homescreenitems,
        ));
  }
}
