// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxOkey = false;
  String? _inputText = "";
  bool isLoading = false;

  void checkBoxChanges(bool value) {
    isCheckBoxOkey = value;
    notifyListeners();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> controlTextValue() async {
    _changeLoading();
    await Future.delayed(const Duration(seconds: 1));
    _changeLoading();
    return _inputText != null;
  }
}
