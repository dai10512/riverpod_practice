import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/3_Riverpod_and_StateNotifierProvider/models/color_state.dart';

final colorStateController = StateNotifierProvider<ColorStateController, ColorState>(
  (ref) => ColorStateController(const ColorState()),
);

class ColorStateController extends StateNotifier<ColorState> {
  ColorStateController(state) : super(state);

  void colorChange() => state = state.copyWith(colorNumber: state.colorNumber + 1);
}

  // var colorNumber = 5;

  // void changeColor() {
  //   if (colorNumber == 17) {
  //     colorNumber = 0;
  //   } else {
  //     colorNumber++;
  //   }
  // }