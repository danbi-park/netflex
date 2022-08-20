import 'package:clone_netflix/model/model_movie.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class DetailScreen extends StatefulWidget {
  // const DetailScreen({Key? key}) : super(key: key);
  final Movie movie;
  DetailScreen({required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool like = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    like = widget.movie.like;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/' + widget.movie.poster),
                          fit: BoxFit.cover)),
                  child: ClipRect(
                      child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.4),
                      child: Container(
                          child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 45, 0, 10),
                            child: Image.asset('images/' + widget.movie.poster),
                            height: 300,
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text(
                              "99% 일치 2019 15+ 시즌 1개",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text(
                              widget.movie.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "재생",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(widget.movie.keyword),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "출연 : 현빈, 손예진, 서지혜\n제작자: 이영효, 박지효",
                              style: TextStyle(
                                color: Colors.white60,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      )),
                    ),
                  )),
                ),
                Positioned(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          like ? Icon(Icons.check) : Icon(Icons.add),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(
                            "내가 찜한 콘텐츠",
                            style:
                                TextStyle(color: Colors.white60, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: Column(children: [
                        Icon(Icons.thumb_up),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "평가",
                          style: TextStyle(color: Colors.white60, fontSize: 11),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Container(
                      child: Column(children: [
                        Icon(Icons.send),
                        Padding(padding: EdgeInsets.all(5)),
                        Text(
                          "공유",
                          style: TextStyle(color: Colors.white60, fontSize: 11),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
