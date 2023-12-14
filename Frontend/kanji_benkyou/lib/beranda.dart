import 'package:flutter/material.dart';

import 'beranda_info_widget.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key, int? index}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final TextEditingController _searchController = TextEditingController();
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height),
            width: (MediaQuery.of(context).size.width),
            color: const Color.fromARGB(255, 69, 46, 201),
          ),
          Column(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 21),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Beranda",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Inria Sans",
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 24,
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 21),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: 318,
                  height: 39,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    onTap: () {
                      setState(() {
                        isTap == false ? isTap = true : isTap = false;
                      });
                    },
                    controller: _searchController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Cari Kanji / Kana / Romaji",
                        border: InputBorder.none,
                        suffixIcon: isTap ? const Icon(Icons.close) : null),
                  ),
                ),
              ),
              const BerandaInfoWidget()
            ],
          )
        ],
      ),
    );
  }
}
