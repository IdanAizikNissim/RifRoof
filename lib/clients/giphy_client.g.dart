import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:cosmic/cosmic_lib.dart'
    show Client, Request, TypeProvider, Middleware;
import 'package:cosmic/annotations/cosmic_annotations.dart' as ANTN;
import 'package:rifroof/clients/converters/giphy_converter.dart';
import 'package:rifroof/models/gif.dart';

class GiphyClient extends Client {
  final url = "https://api.giphy.com/v1/gifs";
  final converter = const GiphyConverter();

  Future<Gif> random(api_key, tag, rating) {
    final Type returnType = Gif;
    final String path = "/random";

    return _callMiddleware(
        new Request(
          "$url/random?api_key=$api_key&tag=$tag&rating=$rating",
          http.get,
          ANTN.Get,
        ),
        returnType,
        path);
  }

  Future<List<Gif>> search(api_key, q, limit, offset, rating, lang) {
    final Type returnType = const TypeProvider<List<Gif>>().type;
    final String path = "/search";

    return _callMiddleware(
        new Request(
          "$url/search?api_key=$api_key&q=$q&limit=$limit&offset=$offset&rating=$rating&lang=$lang",
          http.get,
          ANTN.Get,
        ),
        returnType,
        path);
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

  Future<dynamic> _callMiddleware(Request request, Type returnType, String path,
      {int index = 0,
      Completer completer,
      List<Middleware> reqMiddlewares}) async {
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
}
