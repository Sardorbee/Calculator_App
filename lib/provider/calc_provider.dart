import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  String _overALL = "0";

  String get overAll => _overALL;

  void addNumbers({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    _overALL = (firstNumber + secondNumber).toString();
    notifyListeners();
  }

  void subtractNumbers({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    _overALL = (firstNumber - secondNumber).toString();
    notifyListeners();
  }

  void divideNumbers({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    _overALL = (firstNumber / secondNumber).toString();
    notifyListeners();
  }

  void multiplyNumbers({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    _overALL = (firstNumber * secondNumber).toString();
    notifyListeners();
  }

  void middleGeometrics({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    _overALL = (pow((firstNumber * secondNumber), 0.5)).toString();
    notifyListeners();
  }

  void middleAriphmetrics({required String first, required String second}) {
    int firstNumber = int.parse(first);
    int secondNumber = int.parse(second);
    _overALL = ((firstNumber + secondNumber) / 2).toString();
    notifyListeners();
  }

  // void updateSecond(String value) {
  //   _secondValue = value;
  //   notifyListeners();
  // }
}












