import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:votting/core/providers/bottom_bar_provider.dart';
import 'package:votting/core/providers/election_provider.dart';

import 'disposable_provider.dart';
import 'user_provider.dart';

class AppProviders {
  static List<DisposableProvider> _getDisposableProviders(
    BuildContext context,
  ) {
    return [
      context.read<UserProvider>(),
      context.read<BottomBarProvider>(),
      context.read<ElectionProvider>(),
    ];
  }

  static List<SingleChildWidget> storeProviders = [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => BottomBarProvider()),
    ChangeNotifierProvider(create: (_) => ElectionProvider()),
  ];

  static Future<void> disposeAllDisposableProviders(
    BuildContext context,
  ) async {
    await Future.forEach(
      _getDisposableProviders(context),
      (DisposableProvider provider) async {
        provider.disposeValues();
      },
    );
  }
}
