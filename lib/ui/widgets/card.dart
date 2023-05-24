import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.child,
    this.margin,
    this.backgroundColor,
    this.borderRadius = 12,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  });

  final Widget child;
  final double? borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            offset: const Offset(0, 3),
            blurRadius: 4,
          )
        ],
      ),
      alignment: alignment,
      child: child,
    );
  }
}
