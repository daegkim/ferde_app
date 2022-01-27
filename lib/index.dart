import 'dart:developer';

import 'package:flutter/material.dart';

class IndexWidget extends StatefulWidget {
  const IndexWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {
  _IndexWidgetState();

  int navIndex = 1;

  @override
  Widget build(BuildContext context) {
    // 전체를 가득 채우는 방법
    return Scaffold(
      body: const Center(
        child: Text('hello world'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        items: const [
          BottomNavigationBarItem(label: 'guide', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'favorite', icon: Icon(Icons.favorite)),
        ],
        onTap: (idx) {
          log(idx.toString());
        },
      ),
    );
  }
}
