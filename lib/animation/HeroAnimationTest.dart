import 'package:flutter/material.dart';

// Created by Tony.wang on 19-4-16.
class HeroAnimationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
            tag: 'avatar',
            child: ClipOval(
              child: Image.asset(
                'images/img_avator.jpg',
                width: 50,
              ),
            )),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Origin Image'),
                ),
                body: HeroAnimationB(),
              ),
            );
          }));
        },
      ),
    );
  }
}

class HeroAnimationB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(tag: 'avatar', child: Image.asset('images/img_avator.jpg')),
    );
  }
}
