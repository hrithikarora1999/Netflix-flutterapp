
import 'package:flutter/material.dart';
import 'package:moviebiz/Helper/HelperClasses.dart';
import 'package:moviebiz/Helper/HelperFunctions.dart';

class tvShow extends StatefulWidget {
  @override
  _tvShowState createState() => _tvShowState();
}

class _tvShowState extends State<tvShow> {
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
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width,50.0),
          child: TopAppBarTV(),
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
                  child: RowItem(key: PageStorageKey('Binge Worthy TV Shows'),title:'Binge Worthy TV Shows',url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Reality Shows'),title:'Reality Shows',url: 'https://api.themoviedb.org/3/movie/popular?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Crime TV Drama'),title:'Crime TV Drama',url: 'https://api.themoviedb.org/3/movie/upcoming?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
