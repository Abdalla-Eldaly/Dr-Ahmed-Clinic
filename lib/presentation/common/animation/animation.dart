import 'package:flutter/material.dart';

goTo(page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(seconds: 1),
  );
}
