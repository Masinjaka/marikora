import 'dart:math';

import 'package:flutter/material.dart';

class UiScaler extends StatefulWidget {
  const UiScaler(
      {super.key,
      required this.alignment,
      required this.child,
      this.referenceHeight = 1080});

  final int referenceHeight;
  final Widget child;
  final Alignment alignment;

  @override
  State<UiScaler> createState() => _UiScalerState();
}

class _UiScalerState extends State<UiScaler> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double scale = min(screenSize.width / widget.referenceHeight, 1.0);
    return Transform.scale(
      scale: scale,
      alignment: widget.alignment,
      child: widget.child,
    );
  }
}
