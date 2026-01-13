import 'package:flutter/material.dart';
import 'package:style/core/widgets/custom_snack_bar.dart';

void showSnackBar({
  required String message,
  required bool state,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      customSnackBar(
        message: message,
        state: state,
      ),
    );
}
