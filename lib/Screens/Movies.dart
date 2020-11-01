
import 'package:flutter/material.dart';
import 'package:moviebiz/Helper/HelperClasses.dart';
import 'package:moviebiz/Helper/HelperFunctions.dart';

class Movies extends StatefulWidget {
  const Movies({Key key}) : super(key: key);

  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton(
            backgroundColor: Colors.grey[850],
            child: Icon(Icons.cast),
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width,50.0),
          child: TopAppBarMovie(),
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
                  child: RowItem(key: PageStorageKey('Action'),title:'Action',url: 'https://api.themoviedb.org/3/movie/now_playing?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Comedy'),title:'Comedy',url: 'https://api.themoviedb.org/3/movie/popular?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),
                Container(
                  child: RowItem(key: PageStorageKey('Romance'),title:'Romance',url: 'https://api.themoviedb.org/3/movie/upcoming?api_key=8d54a9d0434001cd94e29ffbb691f091&language=en-US&page=1',),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
