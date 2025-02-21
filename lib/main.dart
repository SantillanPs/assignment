import 'package:flutter/material.dart';
import "views/authorized_pages/Dashboard.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Dashboards();
  }
}
