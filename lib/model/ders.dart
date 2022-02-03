class Ders {
  final String ad;
  final double harfDegeri;
  final double krediDegeri;
  Ders({
    required this.ad,
    required this.harfDegeri,
    required this.krediDegeri,
  });

  @override
  String toString() =>
      'Ders(ad: $ad, harfDegeri: $harfDegeri, krediDegeri: $krediDegeri)';
}
