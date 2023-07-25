import 'package:calc_provider/provider/calcprovider.dart';
import 'package:calc_provider/ui/you/callc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalcProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Calculator(),
      ),
    );
  }
}
