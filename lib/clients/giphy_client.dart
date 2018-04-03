import 'dart:async';
import 'package:cosmic/annotations/cosmic_annotations.dart';
import 'package:cosmic/cosmic_lib.dart' as Cosmic;
import 'package:rifroof/clients/converters/giphy_converter.dart';
import 'package:rifroof/models/gif.dart';

@Client(
  path: "https://api.giphy.com/v1/gifs",
  converter: const GiphyConverter(),
)
class GiphyClient extends Cosmic.Client {
  @Get('/random')
  Future<Gif> random({
    @Query('api_key') String apiKey,
    @Query('tag') String tag,
    @Query('rating') String rating,
  });

  @Get('/search')
  Future<List<Gif>> search({
    @Query('api_key') String apiKey,
    @Query('q') String q,
    @Query('limit') int limit,
    @Query('offset') int offset,
    @Query('rating') String rating,
    @Query('lang') String lang = "en",
  });
}