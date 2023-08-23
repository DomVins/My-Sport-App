import 'package:flutter/material.dart';
import 'package:my_sport_app/crate.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 10,
                        ),
                        Text('New tab')
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              title: const Text(
                                'Close all tabs?',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              content: const Text(
                                  'You can find your closed tabs on the history'),
                              actions: [
                                OutlinedButton(
                                  child: const Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                OutlinedButton(
                                  child: const Text('Close all tabs'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Crate(),
                                        ));
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.clear))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
