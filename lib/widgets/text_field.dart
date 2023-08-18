import 'package:flutter/material.dart';
import 'package:wsn/utils/constants.dart';
import 'package:wsn/utils/constants.dart';

TextField input({ required String placeholder, required TextEditingController controller, required bool enabled }) {
  return TextField(
    controller: controller,
    maxLength: 10,
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      hintText: placeholder,
      hintStyle: TextStyle(
        color: dark50
      ),
      counterText: "",

      prefixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 2.0, 0),
        child: Icon(Icons.call_sharp, color: appBrand),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: BorderSide(width: 3, color: dark50),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: BorderSide(width: 3, color: appBrand),
      ),
      contentPadding: const EdgeInsets.all(24.0),
      enabled: enabled,
    ),

    onChanged: (value) {
      value = value.replaceAll(RegExp('[a-zA-z]'), '');
    },

    style: TextStyle(
      fontSize: textL,
      fontWeight: FontWeight.w600,
      color: appBrand
    ),
  );
}