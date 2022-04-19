import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/3_Riverpod_and_StateNotifierProvider/models/counter_state.dart';

final counterStateController = StateNotifierProvider<CounterStateController, CounterState>(
  (ref) => CounterStateController(const CounterState()),
);

class CounterStateController extends StateNotifier<CounterState> {
  CounterStateController(CounterState state) : super(state);

  void increment() => state = state.copyWith(count: state.count + 1);
  void decrement() => state = state.copyWith(count: state.count - 1);
}
