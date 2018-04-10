part of 'giphy_client.dart';

abstract class _$GiphyClient {
  final url = "https://api.giphy.com/v1/gifs";
  final converter = const GiphyConverter();

  Future<Gif> random({String apiKey, String tag, String rating}) {
    final Type returnType = Gif;
    final String path = "/random";

    return _callMiddleware(
            new Cosmic.Request(
              "$url/random?api_key=$apiKey&tag=$tag&rating=$rating",
              http.get,
              Get,
            ),
            returnType,
            path)
        .then<Gif>((results) => results);
  }

  Future<List<Gif>> search(
      {String apiKey,
      String q,
      int limit,
      int offset,
      String rating,
      String lang}) {
    final Type returnType = const Cosmic.TypeProvider<List<Gif>>().type;
    final String path = "/search";

    return _callMiddleware(
            new Cosmic.Request(
              "$url/search?api_key=$apiKey&q=$q&limit=$limit&offset=$offset&rating=$rating&lang=$lang",
              http.get,
              Get,
            ),
            returnType,
            path)
        .then<List<Gif>>((results) => results);
  }

  Future<List<Gif>> trending({String apiKey, int limit, String rating}) {
    final Type returnType = const Cosmic.TypeProvider<List<Gif>>().type;
    final String path = "/trending";

    return _callMiddleware(
            new Cosmic.Request(
              "$url/trending?api_key=$apiKey&limit=$limit&rating=$rating",
              http.get,
              Get,
            ),
            returnType,
            path)
        .then<List<Gif>>((results) => results);
  }

  Future<dynamic> _request(Future<http.Response> req, Type returnType) {
    var completer = new Completer();

    req.then((response) {
      if (returnType == http.Response) {
        completer.complete(response);
      } else if (response.body == null) {
        completer.completeError(response);
      } else {
        completer.complete(converter.decode(response.body, type: returnType));
      }
    }).catchError((error) => completer.completeError(error));

    return completer.future;
  }

  Future<dynamic> _callMiddleware(
      Cosmic.Request request, Type returnType, String path,
      {int index = 0,
      Completer completer,
      List<Cosmic.Middleware> reqMiddlewares}) async {
    reqMiddlewares = reqMiddlewares ?? getMiddlewares(path);
    completer = completer ?? new Completer();

    if (index >= reqMiddlewares.length) {
      completer.complete(await _request(request.bind(), returnType));
    } else {
      reqMiddlewares[index](request, () {
        _callMiddleware(request, returnType, path,
            index: index + 1,
            completer: completer,
            reqMiddlewares: reqMiddlewares);
      });
    }

    return completer.future;
  }

  List<Cosmic.Middleware> getMiddlewares(String path);
}
