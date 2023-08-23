import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../colors.dart';

class Browse extends StatefulWidget {
  const Browse({super.key, this.search, this.url});
  final bool? search;
  final String? url;
  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchController = TextEditingController();

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
        /*  onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        }, */
      ),
    )
    ..loadRequest(Uri.parse('https://google.com'));

  @override
  void initState() {
    super.initState();
    webViewController.loadRequest(Uri.parse((widget.url ?? '').isEmpty
        ? 'https://google.com'
        : widget.url.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          header(context),
          Expanded(
            child: WebViewWidget(
              controller: webViewController,
            ),
          ),
        ]),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      color: appColor,
      padding: const EdgeInsets.only(left: 14, top: 8, bottom: 12, right: 14),
      child: Row(children: [
        Expanded(
          child: Container(
            height: 30,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                Expanded(
                    child: TextFormField(
                  autofocus: widget.search ?? false ? true : false,
                  focusNode: searchFocusNode,
                  controller: searchController,
                  onFieldSubmitted: (value) {
                    webViewController.loadRequest(
                        Uri.parse("https://www.google.com/search?q=$value"));
                  },
                  decoration: const InputDecoration.collapsed(
                      hintStyle: TextStyle(fontSize: 14),
                      hintText: 'Search url or web adress'),
                )),
                InkWell(
                  onTap: () {
                    searchFocusNode.unfocus();
                    webViewController.loadRequest(Uri.parse(
                        "https://www.google.com/search?q=${searchController.text}"));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 65, 64, 64),
                        borderRadius: BorderRadius.circular(8)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                    margin: const EdgeInsets.only(right: 4),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
