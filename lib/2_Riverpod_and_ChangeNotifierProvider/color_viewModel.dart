import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ColorProvider = ChangeNotifierProvider((ref) => Color());

class Color extends ChangeNotifier {
  var _colorNumber = 5;
  int get colorNumber => _colorNumber;

  void changeColor() {
    if (colorNumber == 17) {
      _colorNumber = 0;
    } else {
      _colorNumber++;
    }
    notifyListeners();
  }
}