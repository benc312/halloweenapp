import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

Random rand = Random();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.bluegrey,
            secondary: Colors.lightblue),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List show = [
    true,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false
  ];
  int _counter = 0;
  int _counter2 = 0;
  List arr1 = [
    'assets/benrizz.JPG',
    'assets/alex.jpg',
    'assets/ben.jpg',
    'assets/nun.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text('HallowGame, $_counter')),
        body: SafeArea(
            child: Table(
                    border: const TableBorder(
                      horizontalInside: BorderSide(color: Colors.white),
                      verticalInside: BorderSide(color: Colors.white),
                    ),
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                        TableRow(children: <Widget>[
                          buildImage(0, show, 0),
                          buildImage(1, show, 0),
                          buildImage(2, show, 0),
                          buildImage(3, show, 0),
                        ]),
                        TableRow(children: <Widget>[
                          buildImage(4, show, 1),
                          buildImage(5, show, 1),
                          buildImage(6, show, 1),
                          buildImage(7, show, 1),
                        ]),
                        TableRow(children: <Widget>[
                          buildImage(8, show, 2),
                          buildImage(9, show, 2),
                          buildImage(10, show, 2),
                          buildImage(11, show, 2),
                        ]),
                        TableRow(children: <Widget>[
                          buildImage(12, show, 3),
                          buildImage(13, show, 3),
                          buildImage(14, show, 3),
                          buildImage(15, show, 3),
                        ]),
                      ])
  }

  Widget buildImage(int count, List show, int meow) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (show[count] == true) {
              int random = rand.nextInt(16);
              while (show[random] != false) {
                random = rand.nextInt(16);
              }
              _counter++;
              show[count] = false;
              show[random] = true;
            }
          });
        },
        child: Visibility(
            visible: show[count],
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            child: Image.asset(arr1[meow], height: 200, fit: BoxFit.fitWidth)
            )
          );
  }

}
