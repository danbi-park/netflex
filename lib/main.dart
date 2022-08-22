import 'package:clone_netflix/screen/home_screen.dart';
import 'package:clone_netflix/screen/more_screen.dart';
import 'package:clone_netflix/widget/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflex',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              Container(
                child: Center(
                  child: Text('Search'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Saved'),
                ),
              ),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
