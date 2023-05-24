import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/user_provider.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({
    super.key,
    this.hideRolUser = '',
    this.onPressed,
  });

  final String? hideRolUser;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Selector<UserProvider, String>(
      selector: (_, userProvider) => userProvider.user.rolName!,
      builder: (BuildContext _, String rolName, Widget? child) {
        if (hideRolUser!.isEmpty) return child!;

        return rolName == hideRolUser ? child! : const SizedBox();
      },
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
