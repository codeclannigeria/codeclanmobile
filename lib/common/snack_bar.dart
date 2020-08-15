import 'package:codeclanmobile/values/values.dart';
import 'package:flutter/material.dart';

class CodeClanSnackBar {
  static void showSuccessSnackBar(BuildContext context,
      {String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        backgroundColor: AppColors.green,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: AppColors.white,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context,
      {String message,
      int milliseconds = 10000,
      SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    Scaffold.of(context).showSnackBar(
      new SnackBar(
        backgroundColor: AppColors.pinkShade1,
        behavior: snackBarBehavior,
        action: SnackBarAction(
            textColor: AppColors.black,
            label: 'DISMISS',
            onPressed: () => _dismissCurrentSnackBar(context)),
        duration: Duration(milliseconds: milliseconds),
        content: SelectableText(
          message,
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }

  static void _dismissCurrentSnackBar(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();
  }
}
