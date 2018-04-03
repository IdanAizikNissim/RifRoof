import 'package:json_annotation/json_annotation.dart';

part 'gif.g.dart';

@JsonSerializable()
class Gif extends Object with _$GifSerializerMixin {
  final String id;
  final String title;
  final GifImages images;

  @JsonKey(name: "image_frames")
  final String imageFrames;

  Gif(this.id, this.title, this.imageFrames, this.images);

  factory Gif.fromJson(Map<String, dynamic> json) => _$GifFromJson(json);
}

enum Resolution {
  Preview,
  Downsized,
  Medium,
  Large,
}

class GifImages extends Object with _$GifImagesSerializerMixin {
  @JsonKey(name: "preview_gif")
  final GifImage preview;

  @JsonKey(name: "downsized")
  final GifImage downsized;

  @JsonKey(name: "downsized_medium")
  final GifImage medium;

  @JsonKey(name: "downsized_large")
  final GifImage large;

  GifImages(this.preview, this.downsized, this.medium, this.large);

  factory GifImages.fromJson(Map<String, dynamic> json) => _$GifImagesFromJson(json);
}

@JsonSerializable()
class GifImage extends Object with _$GifImageSerializerMixin {
  final String url;
  final String width;
  final String height;
  final String size;

  GifImage(this.url, this.width, this.height, this.size);

  factory GifImage.fromJson(Map<String, dynamic> json) => _$GifImageFromJson(json);
}