// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.myPress});
  final IconData icon;
  final VoidCallback myPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: myPress,
      shape: CircleBorder(),
      fillColor: Color(0xff7F8389),
      child: Icon(icon),
    );
  }
}
