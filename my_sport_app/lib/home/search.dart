import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child: SearchBarWidgetEditable(),
          )
        ],
      )),
    );
  }
}

class SearchBarWidgetEditable extends StatelessWidget {
  const SearchBarWidgetEditable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            )),
        Expanded(
            child: Container(
          height: 45,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  decoration: const InputDecoration.collapsed(
                      hintText: 'Search history...',
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: Icon(
                      Icons.photo_camera_outlined,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        )),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Search',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ))
      ],
    );
  }
}
