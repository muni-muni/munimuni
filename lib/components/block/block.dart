import 'package:flutter/material.dart';

class Block extends StatefulWidget {
  const Block({super.key});

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  TextEditingController etc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: etc,
    );
  }
}
