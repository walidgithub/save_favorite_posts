import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../save_favorite_posts/shared/constant/strings_manager.dart';
Future<bool> onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(AppStrings.warning),
          content: const Text(AppStrings.closeApp),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(AppStrings.no)),
            TextButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: const Text(AppStrings.yes)),
          ],
        );
      });
  return exitApp;
}