import 'dart:developer';

import 'package:ferde_app/components/slide_images.dart';
import 'package:flutter/material.dart';

class IndexWidget extends StatefulWidget {
  const IndexWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexWidgetState();
}

class _IndexWidgetState extends State<IndexWidget> {
  _IndexWidgetState();

  int navIndex = 1;

  Widget getBody() {
    Widget result;
    switch(navIndex) {
      case 0:
        result = const Text('Guide');
        break;
      case 1:
        result = const SlideImagesWidget();
        break;
      case 2:
        result = const Text('Favorite');
        break;
      default:
        result = const Text('Default');
    }
    return result;
  }
  
  Widget getCategory() {
    List<String> categoryList = ["주말특가", "추천", "랭킹", "업데이트", "코디", "세일", "스페셜", "매거진", "TV", "이벤트"];
    Key forwardListKey = UniqueKey();
    Widget forwardList = SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text(categoryList[index % categoryList.length]),
        );
      }),
      key: forwardListKey,
    );

    Widget reverseList = SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text(categoryList[categoryList.length - 1 - (index % categoryList.length)]),
        );
      }),
    );

    return SizedBox(
      child: Scrollable(
        axisDirection: AxisDirection.right,
        viewportBuilder: (context, offset) {
          return Viewport(
            axisDirection: AxisDirection.right,
            offset: offset,
            center: forwardListKey,
            slivers: [
              reverseList,
              forwardList,
            ],
          );
        },
      ),
      height: 60,
    );
    /*
    return SizedBox(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        scrollDirection: Axis.horizontal,
        // itemCount: categoryList.length,
        itemBuilder: (context, index) {
          log(index.toString());
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Text(categoryList[index % categoryList.length]),
          );
        },
      ),
      height: 60,
    );
    */
  }

  @override
  Widget build(BuildContext context) {
    // 전체를 가득 채우는 방법
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Ferde App'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getCategory(),
          getBody()
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        items: const [
          BottomNavigationBarItem(label: 'guide', icon: Icon(Icons.book)),
          BottomNavigationBarItem(label: 'home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'favorite', icon: Icon(Icons.favorite)),
        ],
        onTap: (idx) {
          setState(() {
            navIndex = idx;
          });
        },
      ),
    );
  }
}
