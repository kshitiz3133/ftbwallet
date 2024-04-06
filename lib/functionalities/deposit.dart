import 'package:flutter/material.dart';
class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
          TextField(
            decoration: InputDecoration(hintText: "Enter the Email"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter the Email"),
          ),
          TextField(
            decoration: InputDecoration(hintText: "Enter the Email"),
          )
          ],
        ),
      ),
    );
  }
}