import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final StateProvider counterProvider = StateProvider(((ref) => 0));
final StateProvider colorProvider = StateProvider(((ref) => 5));

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorNumber = ref.watch(colorProvider.state).state;

    return Consumer(builder: (context, ref, child) {
      return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.primaries[colorNumber],
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
    return Scaffold(
      appBar: AppBar(title: const Text('Counter and change color')),
      body: Consumer(
        builder: (context, ref, child) {
          final count = ref.watch(counterProvider.state).state;
          final colorNumber = ref.watch(colorProvider.state).state;
          final colorNumberRead = ref.read(colorProvider.state).state;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$count',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.primaries[colorNumber],
                      ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      colorNumberRead == 17
                          ? ref.read(colorProvider.state).state = 0
                          : ref.read(colorProvider.state).state++;
                      // _primarySwatch = Colors.primaries[colorNumber];
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
            onPressed: () => ref.read(counterProvider.state).state++,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.state).state--,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
