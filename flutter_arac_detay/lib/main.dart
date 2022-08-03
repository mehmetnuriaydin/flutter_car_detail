import 'package:flutter/material.dart';
import 'arac_detay.dart';
import 'data/arac_listesi.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        "/": (context) => LoginPage(),
        "/homepage": (context) => AracListesi(),
      },
    );
  }
}
