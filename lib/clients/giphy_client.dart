import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:cosmic/annotations/cosmic_annotations.dart';
import 'package:cosmic/cosmic_lib.dart' as Cosmic;
import 'package:rifroof/clients/converters/giphy_converter.dart';
import 'package:rifroof/models/gif.dart';

part 'giphy_client.g.dart';

@Client(
  path: "https://api.giphy.com/v1/gifs",
  converter: const GiphyConverter(),
)
class GiphyClient extends Cosmic.Client with _$GiphyClient {
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

  @Get('/trending')
  Future<List<Gif>> trending({
    @Query('api_key') String apiKey,
    @Query('limit') int limit,
    @Query('rating') String rating,
  });
}