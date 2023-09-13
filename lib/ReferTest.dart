import 'package:flutter/material.dart';

class ReferTest extends StatefulWidget {
  const ReferTest({Key? key}) : super(key: key);

  @override
  State<ReferTest> createState() => _ReferTestState();
}

class _ReferTestState extends State<ReferTest>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
