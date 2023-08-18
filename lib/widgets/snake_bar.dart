import 'package:flutter/material.dart';
import 'package:wsn/utils/colors_const.dart';

showSnakeBar({required String content, required BuildContext context}) {
  if (context.mounted) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content, style: TextStyle(color: light100)), backgroundColor: appBrand, showCloseIcon: true, closeIconColor: light100,clipBehavior: Clip.antiAlias,)
    );
  } else {
    return null;
  }
}