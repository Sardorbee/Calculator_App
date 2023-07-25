import 'package:calc_provider/provider/calcprovider.dart';
import 'package:calc_provider/ui/you/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Calculator extends StatelessWidget {
  Calculator({super.key});

  TextEditingController a = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> buttonList = [
    "AC",
    "MA",
    "MG",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "+",
    "1",
    "2",
    "3",
    "-",
    "Clear",
    "0",
    ".",
    "=",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 151, 174, 199),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Consumer<CalcProvider>(
                    builder: (context, x, child) {
                      a.text = x.userInput;
                      return Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: x.validateNumber,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                          readOnly: true,
                          inputFormatters: [
                            // FilteringTextInputFormatter.digitsOnly
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d{0,5}'),
                            ),
                          ],
                          controller: a,
                          style: const TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  )),
              Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Consumer<CalcProvider>(
                    builder: (context, x, child) {
                      return Text(
                        x.result,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
        const Divider(color: Colors.white),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: buttonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
              itemBuilder: (BuildContext context, int index) {
                return makedButton(buttonList[index]);
              },
            ),
          ),
        ),
      ]),
    );
  }
}
