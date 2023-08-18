String staticUrl = "whatsapp://send?phone=+91";
whatsappUrl({required String number}) {
  if (number.isNotEmpty) {
    return "$staticUrl$number?text=Hello!";
  }
}