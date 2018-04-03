// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Gif _$GifFromJson(Map<String, dynamic> json) => new Gif(
    json['id'] as String,
    json['title'] as String,
    json['image_url'] as String,
    json['image_width'] as String,
    json['image_height'] as String,
    json['image_frames'] as String);

abstract class _$GifSerializerMixin {
  String get id;
  String get title;
  String get imageUrl;
  String get imageWidth;
  String get imageHeight;
  String get imageFrames;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'image_url': imageUrl,
        'image_width': imageWidth,
        'image_height': imageHeight,
        'image_frames': imageFrames
      };
}
