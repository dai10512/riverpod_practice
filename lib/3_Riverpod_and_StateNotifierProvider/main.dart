import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/3_Riverpod_and_StateNotifierProvider/models/color_state.dart';
import 'package:riverpod_sample/3_Riverpod_and_StateNotifierProvider/models/counter_state.dart';
import 'package:riverpod_sample/3_Riverpod_and_StateNotifierProvider/stateController/color_controller.dart';
import 'package:riverpod_sample/3_Riverpod_and_StateNotifierProvider/stateController/counter_controller.dart';
// 
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorState colorProvider = ref.watch(colorStateController);

    return Consumer(builder: (context, ref, child) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.primaries[colorProvider.colorNumber],
        ),
        home: const Home(),
      );
    });
  }
}

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CounterState counterProvider = ref.watch(counterStateController);
    final ColorState colorProvider = ref.watch(colorStateController);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter and change color')),
      body: Consumer(
        builder: (context, ref, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${counterProvider.count}',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.primaries[colorProvider.colorNumber],
                      ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      ref.read(colorStateController.notifier).colorChange();
                    },
                    child: const Text('Change color'))
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterStateController.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => ref.read(counterStateController.notifier).decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}


// ???1 provider?????
// 1 ??????
//  Provider<String> _provider = Provider((ref) => 'You have pushed the button this many times:');
//  Provider<String> _provider = Provider((ref) => ref.watch(anotherProider).state * 2);
// 2 ??????
//  ref.watch(_provider)
// 3 ??????
//  ????????????

// ???2 stateProvider
// 1 ??????
//  StateProvider<int> counterProvider = StateProvider(((ref) => 0));
// 2 ??????
//  ref.watch(_stateProvider)
// 3 ??????
//  ref.read(_stateProvider.state).state++;
//  ref.read(_stateProvider.state).state = ref.read(_stateProvider) + 1;
//  ref.read(_stateProvider.state).update((state) => state + 1);

//  ref.read(_stateProvider.notifier).state++;
//  ref.read(_stateProvider.notifier).state = ref.read(_stateProvider) + 1;
//  ref.read(_stateProvider.notifier).update((state) => state + 1);

// ???3 StateNotifier ?????? + ????????????
// 1 ??????
//  _provider = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

//  class CounterNotifier extends StateNotifier<int> {
//    CounterNotifier() : super(0);
//    void countUp() {
//      state++;
//    }
//  }

// 2 ??????
//  Text('${ref.watch(_provider)}')

// 3 ??????
//  ref.watch(_provider.notifier).countUp(),

// ???4 ChangeNotifierProvider
// 1 ??????
//   final _provider = ChangeNotifierProvider((ref) => Counter());

//   class Counter extends ChangeNotifier {
//     int _counter = 0;
//     get counter => _counter;

//     void countUp() {
//       _counter++;
//       notifyListeners();
//     }
//   }

// 2 ??????
//   ref.watch(_provider).counter

// 3 ??????
//   ref.watch(_provider).countUp()