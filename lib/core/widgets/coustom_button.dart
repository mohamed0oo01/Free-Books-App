import 'package:flutter/material.dart';

class CoustomButton extends StatelessWidget {
  const CoustomButton({
    super.key,
    required this.BackgroundColor,
    required this.TextColor,
    this.Border_Radius,
    required this.text,
    this.FontSize, required this.onPressed,
  });

  final String text;
  final Color BackgroundColor;
  final Color TextColor;
  final BorderRadius? Border_Radius;
  final double? FontSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: BackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: Border_Radius ?? BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: FontSize,
            fontWeight: FontWeight.w900,
            color: TextColor,
          ),
        ),
      ),
    );
  }
}
