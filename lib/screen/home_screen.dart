import 'package:clone_netflix/model/model_movie.dart';
import 'package:clone_netflix/widget/carousel_slide.dart';
import 'package:clone_netflix/widget/circleSlider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widget/boxSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Movie> movies = [
  //   Movie.fromMap({
  //     'title': '나의 이사 이야기',
  //     'keyword': '일본작품/가족영화/애니매이션 영화',
  //     'poster': 'movie_1.png',
  //     'like': true
  //   }),
  //   Movie.fromMap({
  //     'title': '폭풍 수면! 꿈꾸는 세계 대돌격',
  //     'keyword': '일본작품/가족영화/애니매이션 영화',
  //     'poster': 'movie_2.png',
  //     'like': false
  //   }),
  //   Movie.fromMap({
  //     'title': '엄청 맛있어! B급 음식 서바이벌',
  //     'keyword': '일본작품/가족영화/애니매이션 영화',
  //     'poster': 'movie_3.png',
  //     'like': false
  //   }),
  //   Movie.fromMap({
  //     'title': '정면승부! 로봇 아빠의 역습',
  //     'keyword': '일본작품/가족영화/애니매이션 영화',
  //     'poster': 'movie_4.png',
  //     'like': false
  //   })
  // ];

  Firestore firestore = Firestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = firestore.collection('movie').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('movie').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          } else {
            return _buildBody(context, snapshot.data!.documents);
          }
        });
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((e) => Movie.fromSnapshot(e)).toList();
    return ListView(
      children: [
        Stack(
          children: [
            CarouselImage(
              movies: movies,
            ),
            TopBar(),
          ],
        ),
        CircleSlider(
          movies: movies,
        ),
        BoxSlider(
          movies: movies,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'images/main_logo.png',
              fit: BoxFit.contain,
              height: 25,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
              child: Text(
                'TV 프로그램',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
              child: Text(
                '영화',
                style: TextStyle(fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 1, 0),
              child: Text(
                '내가 찜한 콘텐츠',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ));
  }
}
