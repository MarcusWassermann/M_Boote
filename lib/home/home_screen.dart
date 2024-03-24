
import 'package:flutter/material.dart';
import 'package:m_boote/home/drawer_content.dart';
import 'package:m_boote/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const HomeBody(),
      drawer: const DrawerContent(),
    );
  }
}
