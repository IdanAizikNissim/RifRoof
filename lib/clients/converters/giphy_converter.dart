import 'dart:convert';

import 'package:cosmic/cosmic_lib.dart' as cosmic;
import 'package:rifroof/models/gif.dart';

class GiphyConverter extends cosmic.Converter {
  const GiphyConverter();
  
  @override
  decode(String data, {Type type}) {
    final obj = json.decode(data)['data'];
    if (obj is List) {
      return obj.map((obj) => new Gif.fromJson(obj)).toList();
    } else {
      return new Gif.fromJson(obj); 
    }
  }
  
  @override
  String encode(object) => (object as Gif).toString();
}