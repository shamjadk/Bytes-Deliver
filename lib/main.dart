import 'package:bytes_deliver/core/objectbox_store.dart';
import 'package:bytes_deliver/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartStore.create();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      scaffoldMessengerKey: MyApp.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
