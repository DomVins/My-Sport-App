import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors.dart';

class MoreTopStories extends StatefulWidget {
  const MoreTopStories({super.key});

  @override
  State<MoreTopStories> createState() => _MoreTopStoriesState();
}

class _MoreTopStoriesState extends State<MoreTopStories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "More Stories",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            topStories(),
            topStories(),
            addsBlock(),
            topStories(),
            topStories(),
            topStories(),
            topStories(),
            addsBlock(),
            topStories(),
            topStories(),
            topStories(),
            topStories(),
            topStories(),
            topStories(),
          ],
        ),
      ),
    );
  }
}

topStories() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 4, spreadRadius: 0.1)
        ]),
    width: double.maxFinite,
    height: 180,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Stack(fit: StackFit.expand, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: /* Image.asset(
            item.imageUrl,
            fit: BoxFit.cover,
          ) */
                Container()),
        Positioned.fill(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              padding: const EdgeInsets.only(
                  left: 14, right: 14, bottom: 10, top: 8),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Hi",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ]),
    ),
  );
}

addsBlock() {
  return Container(
    width: double.maxFinite,
    height: 250,
    // margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.grey.shade300, borderRadius: BorderRadius.circular(5)),
    child: const Center(
      child: Text(
        "300x250 Adds",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
