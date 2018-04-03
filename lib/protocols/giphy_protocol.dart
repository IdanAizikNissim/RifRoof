import 'dart:async';

import 'package:rifroof/models/gif.dart';
import 'package:rifroof/models/gif_rating.dart';

abstract class GiphyProtocol {
  Future<Gif> random({String tag = "", GifRating rating = GifRating.G});
  Future<List<Gif>> search(String query, {int limit = 20, int offset = 0, GifRating rating = GifRating.G});
  Future<List<Gif>> trending({int limit = 100, GifRating rating = GifRating.G});
}