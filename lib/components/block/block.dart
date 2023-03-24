import 'package:flutter/material.dart';

class Block extends StatefulWidget {
  final String? blockId;
  const Block({super.key, this.blockId});
  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  TextEditingController _etc = TextEditingController();

  
  @override
  void initState() {
    _etc.text = "tset sate";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        minLines: 1,
        maxLines: 500,
        controller: _etc,
        decoration: InputDecoration(
          border: InputBorder.none,
        ));
  }
}
