import 'package:codeprm/pages/About.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        title: Center(child: Text("About me")),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: "NEXT",
          ),
        ],
      ),
      body: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: [
          AboutBody(),
          AboutBody(),
          AboutBody(),
          AboutBody(),
          AboutBody(),
          AboutBody(),
        ],
      ),
    );
  }
}

class RowProduct extends StatelessWidget {
  const RowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Expanded(flex: 1, child: AboutImage()),
        Expanded(flex: 1, child: AboutImage()),
        Expanded(flex: 1, child: AboutImage()),
        Expanded(flex: 1, child: AboutImage()),
      ],
    );
  }
}
