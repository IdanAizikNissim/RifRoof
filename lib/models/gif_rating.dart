class GifRating {
  static const GifRating Y = const GifRating._("Y");
  static const GifRating G = const GifRating._("G");
  static const GifRating PG = const GifRating._("PG");
  static const GifRating PG_13 = const GifRating._("PG-13");
  static const GifRating R = const GifRating._("R");
  
  final String value;

  const GifRating._(this.value);

  @override
  String toString() => this.value;
}