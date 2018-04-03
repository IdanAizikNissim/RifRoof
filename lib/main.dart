import 'package:flutter/material.dart';
import 'package:rifroof/secret_loader.dart';
import 'package:rifroof/widgets/app.dart';

void main() async {
  final secret = await loadSecret();
  runApp(new App(secret));
}