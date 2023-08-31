import 'dart:ui';

import 'package:flutter/material.dart';

class GlassWidget extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final Widget child;
  final Alignment alignment;
  final double border;
  final LinearGradient linearGradient;
  final LinearGradient borderGradient;

  const GlassWidget({super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.blur,
    required this.child,
    required this.alignment,
    required this.border,
    required this.linearGradient,
    required this.borderGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            blurRadius: blur,
            spreadRadius: blur * 0.2,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        gradient: linearGradient,
        border: Border.all(
          width: border,
          color: Colors.white.withOpacity(0.5),
          style: BorderStyle.solid,
          // gradient: borderGradient,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }
}