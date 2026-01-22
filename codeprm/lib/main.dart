import 'package:flutter/material.dart';
import 'package:codeprm/pages/Products.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Center bodyApp() => Center(child: Text('First App'));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: ProductPage());
  }
}
