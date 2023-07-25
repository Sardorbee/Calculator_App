import 'package:calc_provider/provider/calcprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget customButton(String text) {
  return Consumer<CalcProvider>(
    builder: (context, x, child) {
      return InkWell(
        splashColor: const Color(0xFF1d2630),
        onTap: () {
          x.h(text, context);
        },
        child: Ink(
          decoration: BoxDecoration(
            color: x.getBgColor(text),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
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
