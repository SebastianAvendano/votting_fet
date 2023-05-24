import 'package:flutter/material.dart';
import 'package:votting/core/paths/local_paths.dart';
import 'package:votting/core/theme/colors_theme.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        _buildColorBox(context),
        Positioned(
          top: (15 + paddingTop),
          child: _buildImage(),
        ),
        child,
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      LocalAppPaths.logo,
      height: 170,
      width: 170,
      fit: BoxFit.contain,
    );
  }

  Widget _buildColorBox(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: ColorsAppTheme.primaryColor.withOpacity(.2),
    );
  }
}
