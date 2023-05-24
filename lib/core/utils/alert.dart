import 'package:flutter/material.dart';
import 'package:votting/data/enums/type_alert.enum.dart';

class Alert {
  final String text;
  final String title;
  final TextAlign textAlign;
  final BuildContext context;
  final TextStyle? textStyle;
  final List<Widget>? buttons;
  final TypeAlertDialog? type;
  final TextStyle? titleStyle;
  final bool barrierDismissible;

  static const TextStyle _titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle _textStyle = TextStyle(fontSize: 16);

  Alert({
    this.textStyle,
    this.titleStyle,
    this.title = '',
    this.textAlign = TextAlign.center,
    this.buttons = const [],
    this.barrierDismissible = true,
    this.type = TypeAlertDialog.success,
    required this.text,
    required this.context,
  });

  void show() {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: barrierDismissible,
      pageBuilder: (_, __, ___) {
        return WillPopScope(
          onWillPop: () async {
            return barrierDismissible;
          },
          child: AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                _buildContent(),
                _buildButtons(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      color: type!.value.color,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Icon(
        type!.value.icon,
        size: 36,
        color: Colors.white,
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          if (title.isNotEmpty) _buildTitle(title, titleStyle),
          _buildText(text, textStyle),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(buttons!.length, (index) {
          return Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: buttons![index],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTitle(String title, [TextStyle? titleStyle]) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: _titleStyle.merge(titleStyle),
      ),
    );
  }

  Widget _buildText(String text, [TextStyle? textStyle]) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        text,
        textAlign: textAlign,
        style: _textStyle.merge(textStyle),
      ),
    );
  }
}
