import 'package:flutter/material.dart';

class DataHelper {
  static List<String> _tumDerslerinHarfleri() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;

      case 'BA':
        return 3.5;

      case 'BB':
        return 3;

      case 'CB':
        return 2.5;

      case 'CC':
        return 2;

      case 'DC':
        return 1.5;

      case 'DD':
        return 1;

      case 'FD':
        return 0.5;

      case 'FF':
        return 0;

      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _tumDerslerinHarfleri()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _tumKrediler() {
    return List.generate(10, (index) => index + 1).toList();
  }
}
