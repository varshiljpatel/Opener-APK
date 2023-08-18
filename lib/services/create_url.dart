import 'package:flutter/material.dart';

String staticUrl = "whatsapp://send?phone=+91";
whatsappUrl({required String number}) {
  if (number.isNotEmpty) {
    return "$staticUrl$number?text=${Uri.encodeComponent("Hello!")}";
  }
}