import 'package:calc_provider/provider/calc_provider.dart';
import 'package:calc_provider/ui/ariph_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();
    final FocusNode focusNode2 = FocusNode();

  
    TextEditingController firstcont = TextEditingController();
    TextEditingController secondcont = TextEditingController();
    var prov = Provider.of<CalculatorModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CalculatorModel>(
            builder: (context, x, child) {
              return Text(
                "Result: ${x.overAll}",
                style: const TextStyle(fontSize: 45),
              );
            },
          ),
          const SizedBox(
            height: 45,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              focusNode: focusNode,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d{0,5}'), // Allow up to 5 digits (100000)
                ),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter first number',
              ),
              keyboardType: TextInputType.number,
              controller: firstcont,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              focusNode: focusNode2,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d{0,5}'),
                ),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter second number',
              ),
              keyboardType: TextInputType.number,
              controller: secondcont,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
          ),
          AriphmethicButtons(
              firstcont: firstcont, secondcont: secondcont, prov: prov),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (firstcont.text.isNotEmpty && secondcont.text.isNotEmpty) {
                    prov.middleAriphmetrics(
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
                child: const Text("O'rta arifmetigi"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (firstcont.text.isNotEmpty && secondcont.text.isNotEmpty) {
                    prov.middleGeometrics(
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
                child: const Text("O'rta geometrigi"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
