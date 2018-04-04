import 'package:flutter/material.dart';
import 'package:rifroof/models/gif.dart';

const _k404Gif = "https://media.giphy.com/media/BEYRc8P1IaiaY/giphy.gif";

class GifView extends StatefulWidget {
  final Gif gif;
  final Resolution resolution;

  GifView(this.gif, [this.resolution = Resolution.Preview]);

  @override
  State<StatefulWidget> createState() => new GifViewState();
}

class GifViewState extends State<GifView> {
  void _likeGif() {

  }

  GestureDetector _onGestureDetector({Widget child}) {
    return new GestureDetector(
      onDoubleTap: _likeGif,
      child: child,
    );
  }

  Widget _gifImage() {
    GifImage image;

    switch (widget.resolution) {
      case Resolution.Preview:
        image = widget.gif.images.preview;
        break;
      case Resolution.Downsized:
        image = widget.gif.images.downsized;
        break;
      case Resolution.Medium:
        image = widget.gif.images.medium;
        break;
      case Resolution.Large:
        image = widget.gif.images.large;
        break;
    }

    return new Image.network(image != null ? image.url : _k404Gif, fit: BoxFit.fill);
  }

  @override
  Widget build(BuildContext context) {
    return _onGestureDetector(
      child: new Container(
        child: _gifImage(),
      ),
    );
  }
}