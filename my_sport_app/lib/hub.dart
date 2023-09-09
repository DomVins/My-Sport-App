import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'hub_items/home/home.dart';

class Crate extends StatefulWidget {
  const Crate({Key? key}) : super(key: key);

  @override
  State<Crate> createState() => _CrateState();
}

class _CrateState extends State<Crate> {
  WebViewController bardWebViewController = WebViewController()
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
        /*  onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        }, */
      ),
    )
    ..loadRequest(Uri.parse('https://bard.google.com'));

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int selectedIndex = 0;

  List<Widget> frameItems() {
    return [
      const Home(),
      const Center(
        child: Text('Follow'),
      ),
      const Center(
        child: Text('Match'),
      ),
      const Center(
        child: Text('Stats'),
      ),
      Center(
        child: SafeArea(
          child: Expanded(
            child: WebViewWidget(
              controller: bardWebViewController,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        body: frameItems()[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 65, 64, 64),
            unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
            selectedItemColor: Colors.green,
            selectedIconTheme: const IconThemeData(color: Colors.green),
            unselectedIconTheme: const IconThemeData(color: Colors.white),
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              const BottomNavigationBarItem(
                  label: 'Home', icon: Icon(Icons.home_rounded)),
              const BottomNavigationBarItem(
                  label: 'Follow',
                  icon: Icon(
                    Icons.sports_football_rounded,
                  )),
              const BottomNavigationBarItem(
                  label: 'Match', icon: Icon(Icons.sports)),
              const BottomNavigationBarItem(
                  label: 'Stats', icon: Icon(Icons.signal_cellular_alt)),
              BottomNavigationBarItem(
                label: 'Ask AI',
                icon: Image.asset(
                  "assets/icons/chatbot.png",
                  width: 25,
                  height: 25,
                  color: Colors.white,
                ),
                activeIcon: Image.asset(
                  "assets/icons/chatbot.png",
                  width: 25,
                  height: 25,
                  color: Colors.green,
                ),
              ),
            ]),
      ),
    );
  }
}
