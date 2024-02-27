import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List to hold initial items
  final List<String> items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    const String title = 'Long List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            title,
          ),
        ),
        body: ListView.builder(
          // itemCount is set to the length of items plus 1 to accommodate loading more items
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              return ListTile(
                title: Text(
                  items[index],
                ),
              );
            } else {
              // Call the function to load more items
              myTypedFuture();

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> myTypedFuture() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    // Update the state with additional items
    setState(
      () {
        final List<String> items2 = List<String>.generate(
          10,
          (i) => "Item ${items.length + i}",
        );
        items.addAll(
          items2,
        );
      },
    );
  }
}
