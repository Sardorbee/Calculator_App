import 'package:calc_provider/provider/calc_provider.dart';
import 'package:flutter/material.dart';

class AriphmethicButtons extends StatelessWidget {
  const AriphmethicButtons({
    super.key,
    required this.firstcont,
    required this.secondcont,
    required this.prov,
  });

  final TextEditingController firstcont;
  final TextEditingController secondcont;
  final CalculatorModel prov;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            if (firstcont.text.isNotEmpty && secondcont.text.isNotEmpty) {
              prov.addNumbers(first: firstcont.text, second: secondcont.text);
              firstcont.clear();
              secondcont.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Qaysidir qatorni kiritmadingizmi??"),
                ),
              );
            }
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (firstcont.text.isNotEmpty && secondcont.text.isNotEmpty) {
              prov.subtractNumbers(
                  first: firstcont.text, second: secondcont.text);
              firstcont.clear();
              secondcont.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Qaysidir qatorni kiritmadingizmi??"),
                ),
              );
            }
          },
          child: const Icon(
            Icons.remove,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (firstcont.text.isNotEmpty && secondcont.text.isNotEmpty) {
              prov.divideNumbers(
                  first: firstcont.text, second: secondcont.text);
              firstcont.clear();
              secondcont.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Qaysidir qatorni kiritmadingizmi??",
                  ),
                ),
              );
            }
          },
          child: const Text(
            "/",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (firstcont.text.isNotEmpty && secondcont.text.isNotEmpty) {
              prov.multiplyNumbers(
                  first: firstcont.text, second: secondcont.text);
              firstcont.clear();
              secondcont.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Qaysidir qatorni kiritmadingizmi??"),
                ),
              );
            }
          },
          child: const Text(
            "*",
            style: TextStyle(fontSize: 25),
          ),
        ),
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red)),
          onPressed: () {
            firstcont.clear();
            secondcont.clear();
          },
          child: const Text("Clear"),
        ),
      ],
    );
  }
}
