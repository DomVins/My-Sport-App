import 'package:flutter/material.dart';
import 'package:my_sport_app/hub.dart';

import '../search.dart';


class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Text(
                          'History',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Search(),
                            ));
                      },
                      child: const Icon(Icons.search)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Crate(),
                            ));
                      },
                      child: const Icon(Icons.clear))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Clear browsing data...',
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 45, 187),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                color: Colors.grey[400],
              )
            ],
          ),
        ),
      ),
    );
  }
}
