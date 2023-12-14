import 'package:flutter/material.dart';

class KanjiList extends StatefulWidget {
  const KanjiList({Key? key, int? index}) : super(key: key);

  @override
  State<KanjiList> createState() => _KanjiListState();
}

class _KanjiListState extends State<KanjiList> {
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
                      "Daftar Kanji",
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
                  padding: const EdgeInsets.all(8),
                  width: 318,
                  height: 71,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 69, 46, 201),
                      border: Border.all(color: Colors.white, strokeAlign: 1),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 38,
                            width: 38,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Text("N5"),
                          ),
                          Text("Grade 1")
                        ],
                      ),
                      Text("80 Kanji")
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
