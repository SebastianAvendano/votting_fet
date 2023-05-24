import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:votting/core/theme/colors_theme.dart';

const UnderlineInputBorder inputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: ColorsAppTheme.primaryColor,
    width: 1,
  ),
);

class TextFormInput extends StatefulWidget {
  final IconData? icon;
  final String hintText;
  final String? labelText;
  final Color? iconColor;
  final bool? obscureText;
  final bool? enabled;
  final IconData? iconSuffix;
  final double? sizeIconSuffix;
  final Function? handleIconsuffix;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final void Function(String)? onFieldSubmitted;

  const TextFormInput({
    Key? key,
    required this.hintText,
    this.icon,
    this.validator,
    this.onChanged,
    this.controller,
    this.iconSuffix,
    this.obscureText,
    this.keyBoardType,
    this.handleIconsuffix,
    this.onFieldSubmitted,
    this.sizeIconSuffix = 24,
    this.labelText,
    this.iconColor = Colors.grey,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<TextFormInput> createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: widget.controller,
      keyboardType: widget.keyBoardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization!,
      enabled: widget.enabled!,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: const TextStyle(fontSize: 16),
        icon: widget.icon != null
            ? Icon(
                widget.icon,
                color: widget.iconColor,
              )
            : null,
        suffixIcon: _getSuffixIcon(),
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  Widget? _getSuffixIcon() {
    if (widget.obscureText != null) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon: Icon(
          obscureText
              ? MaterialCommunityIcons.eye_off
              : MaterialCommunityIcons.eye_outline,
          color: widget.iconColor,
          size: widget.sizeIconSuffix,
        ),
      );
    } else if (widget.iconSuffix != null) {
      return IconButton(
        onPressed: () {
          widget.handleIconsuffix?.call();
        },
        icon: Icon(
          widget.iconSuffix,
          // color: widget.iconColor,
          size: widget.sizeIconSuffix,
        ),
      );
    }
    return null;
  }
}
