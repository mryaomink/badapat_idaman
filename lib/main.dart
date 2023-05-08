import 'package:flutter/material.dart';

import 'package:flutter_osm/badapat_yao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Badapat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BadapatYao(),
    );
  }
}
