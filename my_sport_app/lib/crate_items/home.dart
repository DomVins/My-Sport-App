import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:my_sport_app/home/post_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

import '../colors.dart';
import '../external_site.dart';
import '../home/browse.dart';
import '../home/morestories.dart';
import '../home/options/downloads.dart';
import '../home/options/history.dart';
import '../home/options/tabs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

  late TabController tc;

  double f = 13;
  TextStyle light = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  TextStyle bold = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://google.com'));

  String featureImage = '';
  String title = '';

  Future<void> _fetchAndExtractFeatureImageAndTitle() async {
    try {
      String htmlContent = await fetchHTMLContent(
          'https://mfeatures24.com.ng/2023/08/05/i-love-her-but-i-would-never-call-her-again-pete-edochie-discusses-his-relationship-to-genevieve-nnaji/');
      String featureImageF = extractFeatureImage(htmlContent);
      String titleF = extractTitle(htmlContent);
      setState(() {
        featureImage = featureImageF;
        title = titleF;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    tc = TabController(length: 9, vsync: this);
    tc.addListener(_onTabChanged);
    _fetchAndExtractFeatureImageAndTitle();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await webViewController.canGoBack()) {
          webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mediaIcons('Google', Image.asset("assets/icons/google.png"),
                        'https://google.com'),
                    mediaIcons('Youtube', Image.asset("assets/icons/yt.png"),
                        'https://www.youtube.com/'),
                    mediaIcons(
                        'Facebook',
                        Image.asset("assets/icons/facebook.png"),
                        'https://www.facebook.com/'),
                    mediaIcons(
                        'Instagram',
                        Image.asset("assets/icons/insta.png"),
                        'https://www.instagram.com/'),
                    mediaIcons(
                        'Twitter',
                        Image.asset("assets/icons/twitter.png"),
                        'https://www.twitter.com/'),
                  ],
                ),
              ),
              Container(
                  height: 0.5, color: Colors.grey, width: double.maxFinite),
              SizedBox(
                height: 40,
                child: TabBar(
                    indicatorWeight: 4,
                    isScrollable: true,
                    controller: tc,
                    tabs: [
                      Tab(
                          child: Text(
                        'For you',
                        style: tc.index == 0 ? bold : light,
                      )),
                      Tab(
                          child:
                              Text('Hot', style: tc.index == 1 ? bold : light)),
                      Tab(
                          child: Text('Official',
                              style: tc.index == 2 ? bold : light)),
                      Tab(
                          child: Text('Transfers',
                              style: tc.index == 3 ? bold : light)),
                      Tab(
                          child:
                              Text('EPL', style: tc.index == 4 ? bold : light)),
                      Tab(
                          child: Text('La Liga',
                              style: tc.index == 5 ? bold : light)),
                      Tab(
                          child: Text('Serie A',
                              style: tc.index == 6 ? bold : light)),
                      Tab(
                          child: Text('UEFA',
                              style: tc.index == 7 ? bold : light)),
                      Tab(
                          child: Text('More',
                              style: tc.index == 8 ? bold : light)),
                    ]),
              ),
              Container(
                  height: 0.5, color: Colors.grey, width: double.maxFinite),
              Expanded(
                child: TabBarView(controller: tc, children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.fireplace_rounded),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Top Stories",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MoreTopStories()));
                                  },
                                  child: const Text("More >>"))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          height: 220,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              topStories(title, featureImage, context,
                                  "https://mfeatures24.com.ng/2023/08/05/i-love-her-but-i-would-never-call-her-again-pete-edochie-discusses-his-relationship-to-genevieve-nnaji/"),
                              topStories(title, featureImage, context,
                                  "https://mfeatures24.com.ng/2023/08/05/i-love-her-but-i-would-never-call-her-again-pete-edochie-discusses-his-relationship-to-genevieve-nnaji/"),
                              topStories(title, featureImage, context,
                                  "https://mfeatures24.com.ng/2023/08/05/i-love-her-but-i-would-never-call-her-again-pete-edochie-discusses-his-relationship-to-genevieve-nnaji/"),
                              topStories(title, featureImage, context,
                                  "https://mfeatures24.com.ng/2023/08/05/i-love-her-but-i-would-never-call-her-again-pete-edochie-discusses-his-relationship-to-genevieve-nnaji/"),
                              topStories(title, featureImage, context,
                                  "https://mfeatures24.com.ng/2023/08/05/i-love-her-but-i-would-never-call-her-again-pete-edochie-discusses-his-relationship-to-genevieve-nnaji/"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        news(context),
                        news(context),
                        addsBlock(),
                        news(context),
                        news(context),
                        news(context),
                        news(context),
                        addsBlock(),
                        news(context),
                        news(context),
                        news(context),
                        news(context),
                        addsBlock(),
                        news(context),
                        news(context),
                      ],
                    ),
                  ),
                  newsContainer(context),
                  newsContainer(context),
                  newsContainer(context),
                  newsContainer(context),
                  newsContainer(context),
                  newsContainer(context),
                  newsContainer(context),
                  newsContainer(context),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTabChanged() {
    if (tc.indexIsChanging) return;
    setState(() {});
  }

  Widget mediaIcons(String name, Image image, String url) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Browse(
                url: url,
              ),
            ));
      },
      child: Column(
        children: [
          CircleAvatar(radius: 16, backgroundColor: Colors.white, child: image),
          const SizedBox(
            height: 6,
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      color: appColor,
      padding: const EdgeInsets.only(left: 14, top: 2, bottom: 4, right: 0),
      child: Row(children: [
        Expanded(
          child: Container(
            height: 30,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Browse(
                          search: true,
                        ),
                      ));
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: const EdgeInsets.all(6),
                        child: Image.asset(
                          'assets/icons/google.png',
                          height: 25,
                          width: 25,
                        )),
                    const SizedBox(
                      width: 6,
                    ),
                    const Expanded(
                        child: Text(
                      'Search url or web adress',
                      style: TextStyle(fontSize: 14),
                    )),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 65, 64, 64),
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      margin: const EdgeInsets.only(right: 4),
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 17,
        ),
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Tabs())),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 255, 255, 255), width: 2),
                borderRadius: BorderRadius.circular(7),
                color: Colors.white),
            height: 24,
            width: 24,
            child: const Center(
              child: Text('4'),
            ),
          ),
        ),
        PopupMenuButton<String>(
          padding: EdgeInsets.zero,
          color: Colors.white,
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                padding: EdgeInsets.zero,
                value: 'a',
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      InkWell(
                          onTap: () async {
                            if (await webViewController.canGoBack()) {
                              Navigator.pop(context);
                              webViewController.goBack();
                            }
                          },
                          child: const Icon(Icons.arrow_back)),
                      InkWell(
                          onTap: () async {
                            if (await webViewController.canGoForward()) {
                              Navigator.pop(context);
                              webViewController.goForward();
                            }
                          },
                          child: const Icon(Icons.arrow_forward)),
                      const Icon(Icons.star_outline),
                      const Icon(Icons.download),
                      const Icon(Icons.clear),
                      const SizedBox(),
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                value: 'b',
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Tabs())),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.add_box_outlined),
                              SizedBox(
                                width: 12,
                              ),
                              Text('New tab')
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            height: 1,
                            width: double.maxFinite,
                            color: Colors.grey[300],
                          )
                        ],
                      )),
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const History())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Row(
                      children: [
                        Icon(Icons.history),
                        SizedBox(
                          width: 12,
                        ),
                        Text('History')
                      ],
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Downloads())),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Row(
                      children: [
                        Icon(Icons.download_done),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Downloads')
                      ],
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Row(
                        children: [
                          Icon(Icons.star),
                          SizedBox(
                            width: 12,
                          ),
                          Text('Bookmarks')
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.grey[300],
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.share),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Share...')
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.tv),
                          const SizedBox(
                            width: 12,
                          ),
                          const Text('Desktop site'),
                          Expanded(child: Container()),
                          const Icon(Icons.check_box_outline_blank_rounded)
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 1,
                      width: double.maxFinite,
                      color: Colors.grey[300],
                    )
                  ],
                ),
              ),
              PopupMenuItem(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Settings')
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.help_outline),
                      SizedBox(
                        width: 12,
                      ),
                      Text('About')
                    ],
                  ),
                ),
              ),
              PopupMenuItem(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Exit')
                    ],
                  ),
                ),
              ),
            ];
          },
        ),
      ]),
    );
  }
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

news(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PostPage()));
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
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
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, blurRadius: 2.0)
                ]),
          )
        ],
      ),
    ),
  );
}

topStories(String title, String image, BuildContext context, String url) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ExternalSite(
                    url: url,
                  )));
    },
    child: Container(
      height: double.maxFinite,
      margin: const EdgeInsets.only(left: 18, bottom: 10),
      width: 190,
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(2),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2.0)]),
      child: Column(
        children: [
          Expanded(
              child: SizedBox(
            width: double.maxFinite,
            child: image.isNotEmpty
                ? Image.network(
                    image,
                    fit: BoxFit.cover,
                  )
                : const Center(child: CircularProgressIndicator()),
          )),
          Container(
            padding: const EdgeInsets.all(10),
            height: 80,
            width: double.maxFinite,
            color: Colors.white,
            child: Center(
                child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
              overflow: TextOverflow.fade,
            )),
          )
        ],
      ),
    ),
  );
}

newsContainer(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        news(context),
        news(context),
        addsBlock(),
        news(context),
        news(context),
        news(context),
        news(context),
        addsBlock(),
        news(context),
        news(context),
        news(context),
        news(context),
        addsBlock(),
        news(context),
        news(context),
      ],
    ),
  );
}

Future<String> fetchHTMLContent(String link) async {
  final response = await http.get(Uri.parse(link));
  return response.body;
}

String extractFeatureImage(String htmlContent) {
  var document = parse(htmlContent);
  var imageElement = document.querySelector('meta[property="og:image"]');
  return imageElement?.attributes['content'] ??
      ''; // Return the image URL or an empty string if not found.
}

String extractTitle(String htmlContent) {
  var document = parse(htmlContent);
  var titleElement = document.querySelector('title');
  return titleElement?.text ??
      ''; // Return the title or an empty string if not found.
}
