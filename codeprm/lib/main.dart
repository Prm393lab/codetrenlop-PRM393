import 'package:flutter/material.dart';
import 'package:codeprm/pages/HomePage.dart';
import 'package:codeprm/pages/Hompage1.dart';
import 'package:codeprm/pages/About.dart';
import 'package:codeprm/pages/Products.dart';
import 'package:codeprm/pages/ProductListPage1.dart';
import 'package:codeprm/pages/test.dart';

import 'package:codeprm/pages/ProductListPage2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Center bodyApp() => Center(child: Text('First App'));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return MaterialApp(home: ProductListPage1());
    return MaterialApp(home: ProductListPage2());
  }
}
