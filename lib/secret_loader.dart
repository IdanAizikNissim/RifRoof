import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Secret {
  String giphy;
  String jsonbin;

  Secret.fromJSON(json) {
    giphy = json['giphy'];
    jsonbin = json['jsonbin'];
  } 
}

Future<Secret> loadSecret() async {
  final data = await rootBundle.loadString('assets/secret.json');
  
  return new Secret.fromJSON(json.decode(data));
}