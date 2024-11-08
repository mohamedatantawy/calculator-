import 'package:flutter/material.dart';
import 'package:teshap/Views/widget/HomeViewBody.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: const HomeviewBody(),
    );
  }
}
