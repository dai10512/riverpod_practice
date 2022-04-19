import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_state.freezed.dart';
part 'color_state.g.dart';

@freezed
abstract class ColorState with _$ColorState {
  const factory ColorState({
    @Default(5) int colorNumber,
  }) = _ColorState;

  factory ColorState.fromJson(Map<String, dynamic> json) => _$ColorStateFromJson(json);
}
