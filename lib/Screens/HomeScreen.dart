

import 'package:flutter/material.dart';
import 'package:moviebiz/Helper/HelperClasses.dart';
import 'package:moviebiz/Helper/HelperFunctions.dart';
import 'package:moviebiz/Screens/Webview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override

  @override
  Widget build(BuildContext context) {
    final Size screenSize=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[850],
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CorWebView()));
            },
            child: Icon(Icons.web),
          ),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width,50.0),
          child: TopAppBar(),
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              //scrollDirection: Axis.vertical,
               //controller: _scrollController,
              children: [
                Container(
                  child: TopBanner(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    child: Preview(
                        key: PageStorageKey('previews'),
                        title:'Previews'),
                  ),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Trending'),title:'Trending Now',url: 'https://api.themoviedb.org/3/trending/movie/week?api_key=8d54a9d0434001cd94e29ffbb691f091',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Netflix Originals'),title:'Netflix Originals',url: 'https://api.themoviedb.org/3/movie/top_rated?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',islarge: true,),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Action'),title:'Now Playing',url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Comedy'),title:'Popular Movies',url: 'https://api.themoviedb.org/3/movie/popular?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Romance'),title:'New Arrivals',url: 'https://api.themoviedb.org/3/movie/upcoming?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

