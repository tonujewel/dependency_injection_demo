import 'package:flutter/material.dart';

import 'config/injectable.dart';
import 'screens/quote/myquote.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dependency Injection Demo',
      home: MyQuotePage(title: 'Dependency Injection Demo Page'),
    );
  }
}
