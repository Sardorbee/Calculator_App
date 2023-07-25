import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcProvider with ChangeNotifier {
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  String userInput = '';
  String result = '';
  getColor(String text) {
    if (text == "*/" ||
        text == "/*" ||
        text == "|" ||
        text == "1" ||
        text == "1" ||
        text == "C*" ||
        text == "(" ||
        text == ")") {
      return const Color.fromARGB(255, 226, 129, 129);
    }

    return Colors.white;
  }

  getBgColor(String text) {
    if (text == "AC") {
      return const Color.fromARGB(255, 226, 129, 129);
    }

    if (text == "=") {
      return const Color.fromARGB(255, 9, 160, 90);
    }

    return const Color.fromARGB(255, 97, 134, 154);
  }

  handleButtons(String text, BuildContext context) {
    // if (userInput.length < 5) {
      if (text == "AC") {
        userInput = "";
        result = "0";
        return;
      }
      if (text == "MA") {
        userInput = "";
        result = "0";

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 151, 174, 199),
              title: const Text("Sonning o'rta Arifmetrigi"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d{0,5}'), // Allow up to 5 digits (100000)
                      ),
                    ],
                    controller: a,
                    onChanged: (value) {},
                    decoration:
                        const InputDecoration(labelText: "Birinchi raqam"),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: b,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d{0,5}'), // Allow up to 5 digits (100000)
                      ),
                    ],
                    onChanged: (value) {},
                    decoration:
                        const InputDecoration(labelText: "Ikkinchi raqam"),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(
                        255,
                        9,
                        160,
                        90,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (a.text.isNotEmpty && b.text.isNotEmpty) {
                      middleAriphmetrics(first: a.text, second: b.text);
                      a.clear();
                      b.clear();
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Qaysidir qatorni kiritmadingizmi??"),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            );
          },
        );
        return;
      }

      if (text == "MG") {
        userInput = "";
        result = "0";

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 151, 174, 199),
              title: const Text("Sonning o'rta Geometrigi"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d{0,5}'), // Allow up to 5 digits (100000)
                      ),
                    ],
                    controller: a,
                    onChanged: (value) {},
                    decoration:
                        const InputDecoration(labelText: "Birinchi raqam"),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: b,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d{0,5}'), // Allow up to 5 digits (100000)
                      ),
                    ],
                    onChanged: (value) {},
                    decoration:
                        const InputDecoration(labelText: "Ikkinchi raqam"),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(
                        255,
                        9,
                        160,
                        90,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (a.text.isNotEmpty && b.text.isNotEmpty) {
                      middleGeometrics(first: a.text, second: b.text);
                      a.clear();
                      b.clear();
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Qaysidir qatorni kiritmadingizmi??"),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ],
            );
          },
        );
        return;
      }

      if (text == "Clear") {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
        return null;
      }
      // Check if the user is trying to enter a negative number after an operator
      if (text.startsWith("-") && userInput.isEmpty) {
        // Do not allow negative numbers at the beginning
        return;
      }

      // Check if the user is trying to enter an operator after a negative number
      if (userInput.endsWith("-") &&
          (text == "+" || text == "*" || text == "/" || text == "=")) {
        // Do not allow operators immediately after a negative sign
        return;
      }

      // if (text.startsWith("-")) {
      //   String? validationError = validateNumber(text.substring(1));
      //   if (validationError != null) {
      //     // Show an error message or handle the error in some way

      //     return;
      //   }
      // } else {
      //   // String? validationError = validateNumber(text);
      //   // if (validationError != null) {
      //   //   // Show an error message or handle the error in some way
      //   //   showAlertDialog();
      //   //   return;
      //   // }
      // }

      if (text == "=") {
        result = calculate();
        userInput = result;

        if (userInput.endsWith(".0")) {
          userInput = userInput.replaceAll(".0", "");
        }

        if (result.endsWith(".0")) {
          result = result.replaceAll(".0", "");
          return;
        }
      }

      userInput = userInput + text;
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text("100 000 dan kichik raqam kiriting??"),
    //     ),
    //   );
    // }
  }

  String calculate() {
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }

  void middleGeometrics({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    result = (pow((firstNumber * secondNumber), 0.5)).toString();
    notifyListeners();
  }

  void middleAriphmetrics({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    result = ((firstNumber + secondNumber) / 2).toString();
    notifyListeners();
  }

  void h(String text, BuildContext context) {
    handleButtons(text, context);
    notifyListeners();
  }

  String? validateNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a number.';
    }
    if (int.tryParse(value) == null) {
      return 'Invalid number format.';
    }
    if (int.parse(value) < 0) {
      return 'Negative numbers are not allowed.';
    }
    if (int.parse(value) > 100000) {
      return 'Number must be less than or equal to 100000.';
    }
    notifyListeners();
    return "";
  }

}
