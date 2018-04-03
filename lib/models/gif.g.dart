// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Gif _$GifFromJson(Map<String, dynamic> json) => new Gif(
    json['id'] as String,
    json['title'] as String,
    json['image_frames'] as String,
    json['images'] == null
        ? null
        : new GifImages.fromJson(json['images'] as Map<String, dynamic>));

abstract class _$GifSerializerMixin {
  String get id;
  String get title;
  GifImages get images;
  String get imageFrames;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'images': images,
        'image_frames': imageFrames
      };
}

GifImage _$GifImageFromJson(Map<String, dynamic> json) => new GifImage(
    json['url'] as String,
    json['width'] as String,
    json['height'] as String,
    json['size'] as String);

abstract class _$GifImageSerializerMixin {
  String get url;
  String get width;
  String get height;
  String get size;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'width': width,
        'height': height,
        'size': size
      };
}

GifImages _$GifImagesFromJson(Map<String, dynamic> json) => new GifImages(
    json['preview_gif'] == null
        ? null
        : new GifImage.fromJson(json['preview_gif'] as Map<String, dynamic>),
    json['downsized'] == null
        ? null
        : new GifImage.fromJson(json['downsized'] as Map<String, dynamic>),
    json['downsized_medium'] == null
        ? null
        : new GifImage.fromJson(json['downsized_medium'] as Map<String, dynamic>),
    json['downsized_large'] == null
        ? null
        : new GifImage.fromJson(json['downsized_large'] as Map<String, dynamic>));

abstract class _$GifImagesSerializerMixin {
  GifImage get preview;
  GifImage get downsized;
  GifImage get medium;
  GifImage get large;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'preview_gif': preview,
        'downsized': downsized,
        'downsized_medium': medium,
        'downsized_large': large
      };
}