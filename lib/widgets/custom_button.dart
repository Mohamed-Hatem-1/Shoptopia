import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  Color? color;

  VoidCallback? onTap;
  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color == null ? Colors.blue : color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
