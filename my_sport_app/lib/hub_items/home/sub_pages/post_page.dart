import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../constants/colors.dart';


class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

List<Widget> comments = [
  commentBlock(
      "Hello pls this is a comment. You can also try by commenting and seeing the effect . . .")
];

class _PostPageState extends State<PostPage> {
  TextEditingController commentController = TextEditingController();
  ScrollController scrollController = ScrollController();

  scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent * 1.15,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Football News",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "OFFICIAL: Axle Disasi signs for Chelsea from Monaco on a #45m transfer fee",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "5 hours ago / Etubi",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 122, 122, 122),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  smallAddsBlock(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up \n\nThis is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up \n\nThis is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up This is a write up ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 20, 20, 20),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: "T8ZOcqZfadA",
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.blueAccent,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.blue,
                          handleColor: Colors.blueAccent,
                        )),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 3,
                        height: 20,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "You may like",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  relatedPost(context),
                  relatedPost(context),
                  relatedPost(context),
                  relatedPost(context),
                  relatedPost(context),
                  relatedPost(context),
                  relatedPost(context),
                  relatedPost(context),
                  smallAddsBlock(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 3,
                        height: 20,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Comments(418)",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: comments,
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 36,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey.shade200),
                  child: Row(children: [
                    const Icon(Icons.edit),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (txt) {
                          setState(() {});
                        },
                        controller: commentController,
                        decoration: const InputDecoration.collapsed(
                            hintText: "Add a comment"),
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              commentController.text.isNotEmpty
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          comments.add(commentBlock(commentController.text));
                          commentController.text = "";
                        });
                        scrollToBottom();
                      },
                      child: const Icon(Icons.send))
                  : const SizedBox(),
              const SizedBox(
                width: 90,
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _shareContent(context);
        },
        tooltip: 'Share',
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/icons/share.jpeg")),
      ),
    );
  }
}

void _shareContent(BuildContext context) {
  Share.share('Check out this amazing content!');
}

commentBlock(String comment) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 16,
              child: Center(
                  child: Text(
                "V",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              )),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              "Vincent Dominic",
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 48, 48, 48),
                  fontWeight: FontWeight.w600),
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.thumb_up_sharp,
              size: 20,
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              "11",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 48, 48, 48),
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 8,
            ),
            const Icon(
              Icons.thumb_down,
              size: 20,
            ),
            const SizedBox(
              width: 2,
            ),
            const Text(
              "2",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 48, 48, 48),
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          comment,
          style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 48, 48, 48),
              fontWeight: FontWeight.w400),
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 8),
        child: Row(
          children: [
            const Text(
              "Reply",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.more_vert_rounded,
              size: 20,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 6,
      ),
    ],
  );
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

relatedPost(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PostPage()));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 2.0)
                ]),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Niger Republic: We'll Crush You Like Maggots, Dont UnderestimateNigerian Army"),
                Text("Freebiesloaded")
              ],
            ),
          ),
        ],
      ),
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

smallAddsBlock() {
  return Container(
    width: double.maxFinite,
    height: 150,
    // margin: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
        color: Colors.grey.shade300, borderRadius: BorderRadius.circular(5)),
    child: const Center(
      child: Text(
        "320x100 Adds",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
