import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomSheetOptions {
  static List<Widget> getItems(BuildContext context, List items) {
    var options = <Widget>[];
    if (Platform.isAndroid) {
      for (var i = 0; i < items.length; i++) {
        options.add(
          ListTile(
            leading: Icon(items[i]['icon']),
            title: Text(
              items[i]['label'],
              style: TextStyle(
                color: items[i]['color'],
              ),
            ),
            onTap: () => Navigator.pop(context, items[i]['value']),
          ),
        );
      }
    } else {
      for (var i = 0; i < items.length; i++) {
        if (!items[i]['isCancel']) {
          options.add(
            CupertinoActionSheetAction(
              isDefaultAction: items[i]['isCancel'] ?? false,
              child: Text(
                items[i]['label'],
                style: TextStyle(
                  color: items[i]['color'] ?? Colors.blueAccent,
                ),
              ),
              onPressed: () => Navigator.pop(context, items[i]['value']),
            ),
          );
        }
      }
    }
    return options;
  }

  static Future show(BuildContext context, List items) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text('Elige una opción'),
          actions: getItems(context, items),
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context, null),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: getItems(context, items),
          );
        },
      );
    }
  }
}
