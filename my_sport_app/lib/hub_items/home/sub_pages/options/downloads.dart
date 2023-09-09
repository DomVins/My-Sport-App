import 'package:flutter/material.dart';
import 'package:my_sport_app/hub.dart';

import '../search.dart';


class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
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
                          'Downloads',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
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
                      child: const Icon(Icons.settings)),
                  const SizedBox(
                    width: 18,
                  ),
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
                    width: 18,
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
                'Using 19.20 MB of 23.82 GB',
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 92, 92, 92),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.maxFinite,
                height: 1,
                color: Colors.grey[400],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  downloadFileType('All', Icons.check),
                  downloadFileType('Images', Icons.image),
                  downloadFileType('Other', Icons.description),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget downloadFileType(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 4,
          ),
          Text(title)
        ],
      ),
    );
  }
}
