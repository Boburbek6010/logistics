import 'package:flutter/material.dart';

class EveryButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Color color;
  const EveryButton({super.key, required this.name, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, top: 15, right: 25),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        height: 50,
        color: color,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(name, style: const TextStyle(
              fontSize: 18,
            color: Colors.white
          ),),
        ),
      ),
    );
  }
}
