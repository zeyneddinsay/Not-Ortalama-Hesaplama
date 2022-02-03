import 'package:flutter/material.dart';
import 'package:not_ortalama_hesaplama/constants/appconstants.dart';
import 'package:not_ortalama_hesaplama/widgets/ortalama_hesapla_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "dinamik ortalama hesaplama",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesaplaPage(),
    );
  }
}
