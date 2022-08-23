import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie>? movies;

  CarouselImage({this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie>? movies;

  List<Widget>? images;

  List<String>? keywords;

  List<bool>? likes;

  int _currentPage = 0;

  String? _currentKeyword;

  @override
  void initState() {
    super.initState();

    movies = widget.movies;

    // images = movies?.map((e) => Image.asset('images/' + e.poster)).toList();
    images = movies?.map((e) => Image.network(e.poster)).toList();

    keywords = movies?.map((e) => e.keyword).toList();

    likes = movies?.map((e) => e.like).toList();

    _currentKeyword = keywords![0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
        ),
        CarouselSlider(
          items: images,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentPage = index;
                  _currentKeyword = keywords![_currentPage];
                },
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
          child: Text(
            _currentKeyword!,
            style: TextStyle(fontSize: 11),
          ),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                child: Column(
              children: [
                likes![_currentPage]
                    ? IconButton(onPressed: () {}, icon: Icon(Icons.check))
                    : IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                Text(
                  '내가 찜한 콘텐츠',
                  style: TextStyle(fontSize: 11),
                )
              ],
            )),
            Container(
              width: 90,
              height: 40,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {},
                child: Row(children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.all(3)),
                  Text(
                    '재생',
                    style: TextStyle(color: Colors.black),
                  )
                ]),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Column(children: [
                IconButton(
                    icon: Icon(
                      Icons.info,
                    ),
                    onPressed: () {}),
                Text(
                  '정보',
                  style: TextStyle(fontSize: 11),
                )
              ]),
            )
          ]),
        ),
        Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes!, _currentPage)),
        )
      ]),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentPage == i
              ? Color.fromRGBO(255, 255, 255, 0.9)
              : Color.fromRGBO(255, 255, 255, 0.4)),
    ));
  }
  return result;
}
