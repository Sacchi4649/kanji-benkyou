import 'package:flutter/material.dart';

Container BuildRadiusCard(
        //334,156,Colors.blue
        double? width,
        double? height,
        Color color,
        Widget widget) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: widget,
    );
