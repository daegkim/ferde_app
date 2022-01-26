import 'package:flutter/material.dart';

class FrontDoorWidget extends StatelessWidget {
  const FrontDoorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 전체를 가득 채우는 방법
    return const Scaffold(
      body: Image(
        image: AssetImage('assets/images/front-door.png'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
