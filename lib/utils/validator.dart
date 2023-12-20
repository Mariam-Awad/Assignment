import 'package:flutter/material.dart';

extension Validator on TextEditingController {
  String getText() => text.trim();

  bool isValidEmail() {
    if (isEmpty()) return false;
    return RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(text);
  }

  bool isValidPassword() {
    if (isEmpty()) return false;
    return text.length < 6 ? false : true;
  }

  bool isValidPhone() {
    if (isEmpty()) return false;
    return text.length == 11 &&
        text.startsWith(RegExp('^(010|012|015|011)'));
  }

  bool isValidLandLine() {
    if (isEmpty()) return false;
    return text.length == 8;
  }

  bool isValidCardPassword() {
    if (isEmpty()) return false;
    return text.length == 4;
  }

  bool isValidInsuranceNumber() {
    if (isEmpty()) return false;
    return text.length == 8;
  }

  bool isValidFarmerCard() {
    if (isEmpty()) return false;
    return text.length == 16;
  }

  bool isEmpty() {
    if (this == null || text.isEmpty || text == null) return false;
    return true;
  }

  bool trimmedAndStillEmpty() {
    return this == null || text == null || text.trim().isEmpty;
  }

  bool isValidName() {
    if (isEmpty()) return false;
    return RegExp(r"^(?=.*?[a-z A-Z]).{2,}$").hasMatch(text);
  }

  bool isValidNationalID() {
    if (isEmpty()) return false;
    return (text.length < 14 || text.length > 14)
        ? false
        : RegExp(
                "^(2|3)[0-9][0-9][0-1][0-9][0-3][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]")
            .hasMatch(text);
  }
}

extension EqualityStrings on String {
  bool isEqual(String text) {
    return this == text;
  }
}
