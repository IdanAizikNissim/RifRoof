import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rifroof/clients/giphy_client.g.dart';
import 'package:rifroof/models/gif_rating.dart';
import 'package:rifroof/models/gif.dart';
import 'package:rifroof/protocols/giphy_protocol.dart';
import 'package:rifroof/secret_loader.dart';
import 'package:rifroof/widgets/pages/home_page.dart';

class App extends StatelessWidget implements GiphyProtocol {
  final Secret secret;
  final GiphyClient _giphyClient = new GiphyClient();

  App(this.secret);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(this),
    );
  }

  /// =============
  /// GiphyProtocol
  /// =============

  @override
  Future<Gif> random({String tag: "", GifRating rating: GifRating.G}) {
    return _giphyClient.random(secret.giphy, tag, rating);
  }

  @override
  Future<List<Gif>> search(String query, {int limit: 20, int offset: 0, GifRating rating: GifRating.G}) {
    return _giphyClient.search(secret.giphy, query, limit, offset, rating, "en");
  }

  @override
  Future<List<Gif>> trending({int limit: 100, GifRating rating: GifRating.G}) {
    return _giphyClient.trending(secret.giphy, limit, rating);
  }
}