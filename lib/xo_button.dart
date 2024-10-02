import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XoButton extends StatelessWidget {
  void Function(int) OnPressed;
  String label;
  int index;
  XoButton({required this.label, required this.OnPressed, required this.index});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => OnPressed(index),
      child: Text(
        '$label',
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.w400),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(03))),
    );
  }
}
