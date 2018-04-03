import 'package:json_annotation/json_annotation.dart';

part 'gif.g.dart';

@JsonSerializable()
class Gif extends Object with _$GifSerializerMixin {
  final String id;
  final String title;

  @JsonKey(name: "image_url")
  final String imageUrl;

  @JsonKey(name: "image_width")
  final String imageWidth;

  @JsonKey(name: "image_height")
  final String imageHeight;

  @JsonKey(name: "image_frames")
  final String imageFrames;

  Gif(this.id, this.title, this.imageUrl, this.imageWidth, this.imageHeight, this.imageFrames);

  factory Gif.fromJson(Map<String, dynamic> json) => _$GifFromJson(json);
}