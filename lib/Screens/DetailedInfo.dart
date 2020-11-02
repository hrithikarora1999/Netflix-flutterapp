

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviebiz/Helper/HelperClasses.dart';
import 'package:moviebiz/Helper/HelperFunctions.dart';
import 'package:moviebiz/models/content_model.dart';

import '../YoutubeWebView.dart';

class DetailedInfo extends StatefulWidget {
  final Content contact;
  final List<Content> contact1;
  DetailedInfo({this.contact,this.contact1});
  @override
  _DetailedInfoState createState() => _DetailedInfoState();
}

class _DetailedInfoState extends State<DetailedInfo> {
  var i;
  final randomnumber = Random().nextInt(18);
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Center(
                          child: Container(
                            width:150,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${base_url}${widget.contact.imagePosterUrl}'
                                ),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${widget.contact.rating.toString().substring(0,2)}% Match',style: TextStyle(color: Colors.green,fontSize: 14,fontWeight: FontWeight.w600),),
                            Text(widget.contact.date,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                            Text(widget.contact.adult?'18+':'16+',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                            Text('1h44m',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600),),
                            Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Center(child: Text('HD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),)),
                            )
                          ],
                        ),
                      ),
                      Text('#${Random().nextInt(9)+1} in India Today',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                     Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 36,
                          width: double.infinity,
                          color: Colors.white,
                          child: FlatButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Youtube(title: widget.contact.name,)));

                            },
                            color: Colors.white,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Icon(Icons.play_arrow,size: 30.0,color: Colors.black,),
                            ),
                            label: const Text('Play',style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
                        child: Container(
                          height: 36,
                          width: double.infinity,
                          color: Colors.white,
                          child: FlatButton.icon(
                            color: Colors.white,
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Icon(Icons.file_download,size: 30.0,color: Colors.black,),
                            ),
                            label: const Text('Download',style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(widget.contact.name,style: TextStyle(color: Colors.white,fontSize: 14,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,right: 0,left: 0.0),
                        child: Container(
                          height: 2,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(widget.contact.description,style: TextStyle(color: Colors.white,fontSize: 14,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 160,top: 10,left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: BannerButton(icon: Icons.add,title: 'My List',),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: BannerButton(icon: Icons.thumb_up,title: 'Rate',),
                            ),
                            BannerButton(icon: Icons.share,title: 'Share',),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0,right: 250,left: 6.0),
                        child: Container(
                          height: 6,
                          width: 150,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 245,top: 10,bottom: 10),
                        child: Text('MORE LIKE THIS',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                      ),
                      GridRow(widget: widget, randomnumber: randomnumber, ),
                      GridRow(widget: widget, randomnumber: randomnumber, ),
                      GridRow(widget: widget, randomnumber: randomnumber, ),
                      GridRow(widget: widget, randomnumber: randomnumber, ),

                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridRow extends StatelessWidget {
  const GridRow({
    Key key,
    @required this.widget,
    @required this.randomnumber,
  }) : super(key: key);

  final DetailedInfo widget;
  final int randomnumber;

  @override
  Widget build(BuildContext context) {
    var r=Random().nextInt(17);
    var r1=Random().nextInt(16);
    var r2=Random().nextInt(15);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                print(widget.contact1[r].name);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: widget.contact1[r],contact1: widget.contact1,)));
              },
              child: Container(
                width:120,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            '${base_url}${widget.contact1[r].imagePosterUrl}'
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: widget.contact1[r2],contact1: widget.contact1,)));
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Container(
                width:120,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            '${base_url}${widget.contact1[r2].imagePosterUrl}'
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedInfo(contact: widget.contact1[r1],contact1: widget.contact1,)));
          },
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Center(
              child: Container(
                width:120,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: NetworkImage(
                            '${base_url}${widget.contact1[r1].imagePosterUrl}'
                        ),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
