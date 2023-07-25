import 'package:calc_provider/provider/calcprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget makedButton(String text) {
  return Consumer<CalcProvider>(
    builder: (context, x, child) {
      return InkWell(
        splashColor: Color.fromARGB(255, 70, 97, 109),
        onTap: () {
          x.h(text, context);
        },
        child: Ink(
          decoration: BoxDecoration(
            color: x.getBgColor(text),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                blurRadius: 4,
                spreadRadius: 0.5,
                offset: const Offset(-3, -3),
              ), // BoxShadow
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: x.getColor(text),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ), // TextStyle
            ), // Text
          ), // Center
        ), // Ink
      );
    },
  ); // InkWell
}
