import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod_and_changeNotifier/color_viewModel.dart';
import 'package:riverpod_sample/riverpod_and_changeNotifier/counter_viewModel.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorProvider = ref.watch(ColorProvider);

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
    final counterProvider = ref.watch(CounterProvider);
    final colorProvider = ref.watch(ColorProvider);

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
                      colorProvider.changeColor();
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
              counterProvider.increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => counterProvider.decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}


// ■provider　×
// 1 定義
//  Provider<String> _provider = Provider((ref) => 'You have pushed the button this many times:');
//  Provider<String> _provider = Provider((ref) => ref.watch(anotherProider).state * 2);
// 2 表示
//  ref.watch(_provider)
// 3 変更
//  できない

// ■stateProvider
// 1 定義
//  StateProvider<int> counterProvider = StateProvider(((ref) => 0));
// 2 表示
//  ref.watch(_stateProvider)
// 3 変更
//  ref.read(_stateProvider.state).state++;
//  ref.read(_stateProvider.state).state = ref.read(_stateProvider) + 1;
//  ref.read(_stateProvider.state).update((state) => state + 1);

//  ref.read(_stateProvider.notifier).state++;
//  ref.read(_stateProvider.notifier).state = ref.read(_stateProvider) + 1;
//  ref.read(_stateProvider.notifier).update((state) => state + 1);

// ■StateNotifier 変数 + メソッド
// 1 定義
//  _provider = StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

//  class CounterNotifier extends StateNotifier<int> {
//    CounterNotifier() : super(0);
//    void countUp() {
//      state++;
//    }
//  }

// 2 表示
//  Text('${ref.watch(_provider)}')

// 3 変更
//  ref.watch(_provider.notifier).countUp(),

// ■ChangeNotifierProvider
// 1 定義
//   final _provider = ChangeNotifierProvider((ref) => Counter());
//   class Counter extends ChangeNotifier {
//     int _counter = 0;
//     get counter => _counter;

//     void countUp() {
//       _counter++;
//       notifyListeners();
//     }
//   }

// 2 表示
//   ref.watch(_provider).counter

// 3 変更
//   ref.watch(_provider).countUp()