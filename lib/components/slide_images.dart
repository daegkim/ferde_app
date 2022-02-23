import 'package:flutter/material.dart';

class SlideImagesWidget extends StatefulWidget {
  const SlideImagesWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlideImagesWidgetState();
}

class _SlideImagesWidgetState extends State<SlideImagesWidget> {
  _SlideImagesWidgetState();
  List<MaterialColor> colors = [Colors.brown, Colors.blue, Colors.deepOrange];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            color: colors[index],
            width: 400,
          );
        },
      ),
      height: 200,
    );
  }
}