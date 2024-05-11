
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollTestPage extends StatefulWidget{
  const ScrollTestPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ScrollTestPageState();
  }
}

class ScrollTestPageState extends State<ScrollTestPage>{
  final List<String> entries = <String>['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8', 'Item 9', 'Item 10', 'Item 11', 'Item 12', 'Item 13', 'Item 14', 'Item 15', 'Item 16', 'Item 17', 'Item 18'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll List Demo"),
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(entries[index]),
          );
        },
      ),
    );
  }
}