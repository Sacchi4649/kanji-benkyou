import 'package:flutter/material.dart';

import 'radius_card.dart';

class BerandaInfoWidget extends StatefulWidget {
  const BerandaInfoWidget({Key? key}) : super(key: key);

  @override
  State<BerandaInfoWidget> createState() => _BerandaInfoWidgetState();
}

class _BerandaInfoWidgetState extends State<BerandaInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 590,
        width: (MediaQuery.of(context).size.width),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                  width: 334,
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Konnichiwa, user\nProgress status:"),
                      Text("Grade 5"),
                      Text("Grade 4"),
                      Text("Grade 3"),
                      Text("Grade 2"),
                      Text("Grade 1"),
                    ],
                  )),
              BuildRadiusCard(
                  334,
                  156,
                  Colors.blue,
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Kanji Harian"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white,
                              width: 115,
                              height: 118,
                              alignment: Alignment.center,
                              child: const Text("愛",
                                  style: TextStyle(fontSize: 72),
                                  textAlign: TextAlign.center),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  color: Colors.white,
                                  width: 187,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: const Text("Ini goresan",
                                      textAlign: TextAlign.center),
                                ),
                                Container(
                                  color: Colors.red,
                                  width: 187,
                                  height: 56,
                                  alignment: Alignment.center,
                                  child: const Text("Ini cara baca",
                                      textAlign: TextAlign.center),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              BuildRadiusCard(334, 150, const Color.fromARGB(255, 69, 46, 201),
                  const Padding(padding: EdgeInsets.all(8)))
            ],
          ),
        ));
  }
}
