import 'package:flutter/material.dart';
import 'package:votting/core/theme/colors_theme.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.textStyle,
    this.height = 50,
    this.borderRaidus = 10,
    this.textColor = Colors.white,
    this.backgroundColor = ColorsAppTheme.primaryColor,
  });

  final String label;
  final double? height;
  final Color? textColor;
  final double? borderRaidus;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      disabledColor: Colors.grey,
      elevation: 0,
      height: height,
      textColor: textColor,
      color: backgroundColor,
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ).merge(textStyle),
        ),
      ),
    );
  }
}
