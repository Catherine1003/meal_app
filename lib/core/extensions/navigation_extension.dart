import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  Future<dynamic> pushWithResult(Widget page) async {
    return await Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => page));
  }

  void pushAndRemoveUntil(Widget page, {bool router = false}) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (context) => page,
      ),
          (route) => router,
    );
  }

  void pop([dynamic value]) {
    Navigator.pop(this, value);
  }
}