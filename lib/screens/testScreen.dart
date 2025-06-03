import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(body: Column(children: [Container(width: Get.width / 2,height: Get.height/2,decoration: BoxDecoration(color: Colors.red),)],),));
  }
}

