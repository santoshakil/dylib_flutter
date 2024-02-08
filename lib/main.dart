import 'dart:ffi';

import 'package:flutter/material.dart';

typedef AddFFI = Uint32 Function(Uint32 left, Uint32 right);
typedef Add = int Function(int left, int right);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dylibTest();
  runApp(const MainApp());
}

void dylibTest() {
  try {
    final start = DateTime.now().microsecondsSinceEpoch;
    final dylib = DynamicLibrary.open('libfa2lib.dylib');
    debugPrint('Open dylib: ${DateTime.now().microsecondsSinceEpoch - start} µs');
    final start2 = DateTime.now().microsecondsSinceEpoch;
    final add = dylib.lookupFunction<AddFFI, Add>('add');
    debugPrint('Lookup function: ${DateTime.now().microsecondsSinceEpoch - start2} µs');
    debugPrint(add(1, 2).toString());
  } catch (e) {
    debugPrint('Error: $e');
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
