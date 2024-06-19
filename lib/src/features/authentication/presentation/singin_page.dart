import 'package:flutter/material.dart';

class SingInForm extends StatelessWidget {
  const SingInForm({required this.route, super.key});

  final String route;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(route),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
