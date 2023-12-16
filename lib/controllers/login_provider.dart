import 'dart:developer';

import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController _kAdiController = TextEditingController();
  TextEditingController get kadiController => _kAdiController;
  TextEditingController _sifreController = TextEditingController();
  TextEditingController get sifreController => _sifreController;
  String? kAdi;
  String? sifre;

  Future girisYap() async {
    log(kAdi!);
    log(sifre!);
    notifyListeners();
  }
}
