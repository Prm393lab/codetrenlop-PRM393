import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Center bodyApp() => Center(child: Text('First App'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage1());
  }
}

class Homepage1 extends StatelessWidget {
  const Homepage1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Home'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const MyColumn()
    );
  }
}

class BackGround1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          color: Colors.cyan
        ),
      ),
    );
  }
}

class BackGround2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(130, 75, 0, 0),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(75),
            color: Colors.amber
        ),
      ),
    );
  }
}

class MyStack extends StatelessWidget{
  const MyStack({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [BackGround1(), BackGround2()],
    );
  }
}


class MyColumn extends StatelessWidget{
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [MyRow(), MyRow(), MyRow(), MyRow(), MyStack()],
    );
  }
}

class MyRow extends StatelessWidget{
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [MyContainer(content: 'content 1'),
                 MyContainer( content: 'content'),
                 MyContainer( content: 'content')
      ],
    );
  }
}

class MyContainer extends StatelessWidget{
  final String content;
  const MyContainer({this.content = '', super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10 , 10 , 10),
      child: Container(
      //  color: Colors.teal,
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: Text(this.content),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.cyan, width: 5
          ),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}