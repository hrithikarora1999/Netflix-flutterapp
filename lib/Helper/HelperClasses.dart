import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:moviebiz/Screens/DetailedInfo.dart';
import 'package:moviebiz/Screens/HomeScreen.dart';
import 'package:moviebiz/Screens/Movies.dart';
import 'package:moviebiz/Screens/MyList.dart';
import 'package:moviebiz/Screens/TvShow.dart';
import 'package:moviebiz/YoutubeWebView.dart';
import 'package:moviebiz/models/content_model.dart';

import 'HelperFunctions.dart';
import 'NetworkHelper.dart';

const base_url = "https://image.tmdb.org/t/p/original";

class TopAppBarTV extends StatefulWidget {
  @override
  _TopAppBarTVState createState() => _TopAppBarTVState();
}

class _TopAppBarTVState extends State<TopAppBarTV> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:Colors.black,
      //Colors.black.withOpacity((widget.ScrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Image.asset(
                'images/netflix_logo0.png',
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: AppBarTextItem(
                      text: 'TV Shows',fun: () {
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>tvShow()));

                    },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopAppBarMovie extends StatefulWidget {
  @override
  _TopAppBarMovieState createState() => _TopAppBarMovieState();
}

class _TopAppBarMovieState extends State<TopAppBarMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:Colors.black,
      //Colors.black.withOpacity((widget.ScrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

              },
              child: Image.asset(
                'images/netflix_logo0.png',
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: AppBarTextItem(
                      text: 'Movies', fun: () {
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Movies()));
                    },
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopAppBarList extends StatefulWidget {
  @override
  _TopAppBarListState createState() => _TopAppBarListState();
}

class _TopAppBarListState extends State<TopAppBarList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:Colors.black,
      //Colors.black.withOpacity((widget.ScrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

              },
              child: Image.asset(
                'images/netflix_logo0.png',
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: AppBarTextItem(
                      text: 'My List', fun: () {
                     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyList()));
                    },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}






class TopAppBar extends StatefulWidget {

  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color:Colors.black,
          //Colors.black.withOpacity((widget.ScrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

              },
              child: Image.asset(
                'images/netflix_logo0.png',
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBarTextItem(
                      text: 'TV Shows',fun: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>tvShow()));

                  },
                    ),
                  AppBarTextItem(
                      text: 'Movies', fun: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Movies()));

                  },
                    ),
                  AppBarTextItem(
                      text: 'My List', fun: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyList()));

                  },
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
List<Content> contacts1 = [];

class TopBanner extends StatefulWidget {
  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  var randomNumber = Random().nextInt(18);

  Future<List<Content>> GetData() async {
    //print(randomNumber);
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.themoviedb.org/3/trending/movie/week?api_key=8d54a9d0434001cd94e29ffbb691f091');
    var data = await networkHelper.getData();
    //print(data["results"][0]);
    List<Content> contacts = [];
    for (int i = 0; i < data["results"].length; i++) {
      Content contact = Content(
        name: data["results"][i]["title"] == null
            ? data["results"][i]["original_title"]
            : data["results"][i]["title"],
        imagePosterUrl: data["results"][i]["poster_path"],
        imageRowurl: data["results"][i]["backdrop_path"],
        description: data["results"][i]["overview"],
        date:data["results"][i]["release_date"].substring(0,4),
        adult:data["results"][i]["adult"],
        rating: data["results"][i]["vote_average"]*10,
      );
      contacts.add(contact);
    }
    contacts1=contacts;
    //print(contacts.length);
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child:
            Text('Trying to Load Data Refresh Please'),
          );/*SpinKitCircle(
            color: Colors.red,
            size: 80,
            duration: Duration(seconds: 3),
          );*/
        } else {
         // print("banner");
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 500.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '${base_url}${snapshot.data[randomNumber].imagePosterUrl}'
                    ),
                    fit: BoxFit.cover
                  )
                ),
              ),
              Container(
                height: 500.0,
                decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black,Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                    )
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 80.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BannerButton(icon:Icons.add,title:'List'),
                    ClipRect(child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Youtube(title: snapshot.data[randomNumber].name,)));
                        },
                        child: PlayButton(Size: 30.0,w: 120.0,))),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: snapshot.data[randomNumber],contact1: snapshot.data,)));

                      },
                        child: BannerButton(icon:Icons.info_outline,title:'Info')),
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}


class Preview extends StatefulWidget {
  final String title;
  Preview({this.title,Key key}):super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  Future<List<Content>> GetData() async {
    //print(randomNumber);
    NetworkHelper networkHelper = NetworkHelper(
        url:
        'https://api.themoviedb.org/3/trending/movie/week?api_key=8d54a9d0434001cd94e29ffbb691f091');
    var data = await networkHelper.getData();
    //print(data["results"][0]);
    List<Content> contacts = [];
    for (int i = 0; i < data["results"].length; i++) {
      Content contact = Content(
        name: data["results"][i]["title"] == null
            ? data["results"][i]["original_title"]
            : data["results"][i]["title"],
        imagePosterUrl: data["results"][i]["poster_path"],
        imageRowurl: data["results"][i]["backdrop_path"],
        description: data["results"][i]["overview"],
        date: data["results"][i]["release_date"].substring(0,4),
        adult:data["results"][i]["adult"],
        rating: data["results"][i]["vote_average"]*10,
      );
      contacts.add(contact);
    }
    contacts1=contacts;
    //print(contacts.length);
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: GetData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child:
            Text('Trying to Load Data Refresh Please'),
          );/*SpinKitCircle(
            color: Colors.red,
            size: 80,
            duration: Duration(seconds: 3),
          );*/
        } else {
         // print("prebiew");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0,bottom: 12.0),
                child: Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w600),),
              ),
              Container(
                  height: 165,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int index)
                      {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: snapshot.data[index],contact1: snapshot.data,)));

                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                height: 110.0,
                                width: 110.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${base_url}${snapshot.data[index].imageRowurl}'
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  //border: Border.all(color: Colors.blue,width: 2.0)
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data.length,
                    itemExtent: 140,
                    //semanticChildCount: 10,)
              ),
                  )
              )
            ],
          );
        }
      },
    );
  }
}

class RowItem extends StatefulWidget {
  final String title;
  final String url;
  final bool islarge;
  RowItem({this.title,this.url,this.islarge=false,Key key,}):super(key: key);

  @override
  _RowItemState createState() => _RowItemState();
}

class _RowItemState extends State<RowItem> {
  Future<List<Content>> GetData() async {
    //print(randomNumber);
    NetworkHelper networkHelper = NetworkHelper(
        url:
        widget.url);
    var data = await networkHelper.getData();
    //print(data["results"][0]);
    List<Content> contacts = [];
    for (int i = 0; i < data["results"].length; i++) {
      Content contact = Content(
        name: data["results"][i]["title"] == null
            ? data["results"][i]["original_title"]
            : data["results"][i]["title"],
        imagePosterUrl: data["results"][i]["poster_path"],
        imageRowurl: data["results"][i]["backdrop_path"],
        description: data["results"][i]["overview"],
        date: data["results"][i]["release_date"].substring(0,4),
       // adult:data["results"][i]["adult"]?null:true,
        //rating: data["results"][i]["vote_average"]*10?null:95,
      );
      contacts.add(contact);
    }
    contacts1=contacts;
    //print(contacts.length);
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: GetData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child:
            Text('Trying to Load Data Refresh Please'),
          );/*SpinKitCircle(
            color: Colors.red,
            size: 80,
            duration: Duration(seconds: 3),
          );*/
        } else {
          //print(widget.title);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10.0),
                child: Text(widget.title,style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.w600),),
              ),
              Container(
                  height: widget.islarge?500:220,
                  //width: double.infinity,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context,int index)
                      {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: snapshot.data[index],contact1: snapshot.data,)));
                          },
                          child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                height: widget.islarge?400:150,
                                width: widget.islarge?250:130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${base_url}${snapshot.data[index].imagePosterUrl}'
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    //border: Border.all(color: Colors.blue,width: 2.0)
                                ),
                              ),
                        );
                      },
                      itemCount: snapshot.data.length,
                      //itemExtent: 140,
                     // semanticChildCount: 10,
                    ),
                  )
              )
            ],
          );
        }
      },
    );
  }
}



