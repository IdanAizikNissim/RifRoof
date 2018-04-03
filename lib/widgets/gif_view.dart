import 'package:flutter/material.dart';
import 'package:rifroof/models/gif.dart';

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
    String url;

    switch (widget.resolution) {
      case Resolution.Preview:
        url = widget.gif.images.preview.url;
        break;
      case Resolution.Downsized:
        url = widget.gif.images.downsized.url;
        break;
      case Resolution.Medium:
        url = widget.gif.images.medium.url;
        break;
      case Resolution.Large:
        url = widget.gif.images.large.url;
        break;
    }

    return new Image.network(url, fit: BoxFit.fill);
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