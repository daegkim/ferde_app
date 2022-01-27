import 'dart:developer';

import 'package:flutter/material.dart';

import 'index.dart';

class FrontDoorWidget extends StatefulWidget {
  const FrontDoorWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FrontDoorWidgetState();
}

class _FrontDoorWidgetState extends State<FrontDoorWidget> with TickerProviderStateMixin {
  _FrontDoorWidgetState();

  // late : run lazily the first time the field is accessed
  // running time에 _controller가 사용되는 시점에 초기화가 된다는 것을 의미한다.
  // vsync: this는 TickerProviderStateMixin를 넣어주는 것을 의미한다. TickerProviderStateMixin는 타이머이며
  // 한마디로 타이머가 객체 생성 시점이 아닌 build시점까지 초기화되는 것을 기다려준다는 것으로 이해했다.
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..forward()
  ..addStatusListener((status) {
    if(status == AnimationStatus.completed){
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const IndexWidget()
        )
      );
    }
  });

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 전체를 가득 채우는 방법
    return Scaffold(
      body: Center(
        child: FadeTransition(
          child: const Image(
            image: AssetImage('assets/images/front-door.png'),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          opacity: _animation,
        ),
      ),
    );
  }
}
