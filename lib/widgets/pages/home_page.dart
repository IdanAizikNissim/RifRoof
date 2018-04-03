import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rifroof/models/gif.dart';
import 'package:rifroof/protocols/giphy_protocol.dart';
import 'package:rifroof/widgets/gif_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const int _kTrendingMenuItemIndex = 0;
const int _kSavedMenuItemIndex = 1;
const int _kRandomMenuItemIndex = 2;

class HomePage extends StatefulWidget {
  final GiphyProtocol giphyProtocol;

  HomePage(this.giphyProtocol);
  
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Gif> _gifs;
  int _currentBottomNavItem;

  HomePageState([this._currentBottomNavItem = 0]);

  @override
  void initState() {
    super.initState();
    _gifs = [];
    _loadGifsForTab(_currentBottomNavItem);
  }

  void _loadGifsForTab(int index) async {
    List<Gif> results;

    switch (index) {
      // Trending
      case _kTrendingMenuItemIndex:
        results = await _loadTrending();
        break;
      // Saved
      case _kSavedMenuItemIndex:
        break; 
      // Random
      case _kRandomMenuItemIndex:
        results = await _loadRandom();
        break; 
    }

    setState(() {
      _gifs = results;
      _currentBottomNavItem = index;
    });
  }

  Future<List<Gif>> _loadTrending() => widget.giphyProtocol.trending();
  
  Future<List<Gif>> _loadRandom([int limit = 2]) async {
    List<Gif> results = [];

    for (int index = 0; index < limit; ++index) {
      results.add(
        await widget.giphyProtocol.random()
      );
    }

    return results;
  }

  int gifsPerRowInList() {
    int per;

    switch (_currentBottomNavItem) {
      case _kTrendingMenuItemIndex:
        per = 3;
        break;
      case _kSavedMenuItemIndex:
        per = 1;
        break;
      case _kRandomMenuItemIndex:
        per = 1;
        break;
    }

    return per;
  }

  Resolution _gifResolution() {
    Resolution res;

    switch (_currentBottomNavItem) {
      case _kTrendingMenuItemIndex:
        res = Resolution.Preview;
        break;
      case _kSavedMenuItemIndex:
        res = Resolution.Large;
        break;
      case _kRandomMenuItemIndex:
        res = Resolution.Medium;
        break;
    }

    return res;
  }

  Widget _buildGifList() {
    final gifsWidgets = _gifs.map((gif) => new GifView(gif, _gifResolution())).toList(growable: false);
    
    return new GridView.count(
      crossAxisCount: gifsPerRowInList(),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: gifsWidgets,
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: _buildGifList(),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomBarItem(IconData icon, String title) {
    return new BottomNavigationBarItem(
      icon: new Icon(icon),
      title: new Text(title),
    );
  }

  Widget _buildNavBar() {
    return new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        _buildBottomBarItem(FontAwesomeIcons.fire, "trending"),
        _buildBottomBarItem(FontAwesomeIcons.heart, "saved"),
        _buildBottomBarItem(FontAwesomeIcons.random, "random"),
      ],
      currentIndex: _currentBottomNavItem,
      onTap: _onBottomNavBarItemSelect,
    );
  }

  void _onBottomNavBarItemSelect(int index) {
    if (index == _currentBottomNavItem && 
      index != _kRandomMenuItemIndex) return;

    _loadGifsForTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildNavBar(),
    );
  }
}