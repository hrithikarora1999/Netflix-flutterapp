
import 'package:flutter/material.dart';
import 'package:moviebiz/Helper/HelperClasses.dart';
import 'package:moviebiz/Helper/NetworkHelper.dart';
import 'package:moviebiz/models/content_model.dart';

import 'DetailedInfo.dart';

class MyList extends StatefulWidget {

  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  Future<List<Content>> GetData() async {
    //print(randomNumber);
    NetworkHelper networkHelper = NetworkHelper(
        url:'https://api.themoviedb.org/3/trending/movie/week?api_key=8d54a9d0434001cd94e29ffbb691f091');
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
      );
      contacts.add(contact);
    }
    contacts1=contacts;
    //print(contacts.length);
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize=MediaQuery.of(context).size;
    return  Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width,50.0),
        child: TopAppBarList(),
      ),
      body: FutureBuilder(
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: screenSize.height,
                      child: GridView.count(
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 3 ,
                          children: List.generate(snapshot.data.length,(index){
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: snapshot.data[index],contact1: snapshot.data,)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Center(
                                  child: Container(
                                    width:300,
                                    height: 500,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${base_url}${snapshot.data[index].imagePosterUrl}'
                                            ),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }))), ],
              ),
            );
          }
        },
      ),
    );
  }
}

