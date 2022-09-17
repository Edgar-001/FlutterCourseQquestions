import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String? text;

  const MyTextWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Text(text ?? 'Text'),
    );
  }
}
