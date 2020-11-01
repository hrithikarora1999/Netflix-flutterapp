

import 'package:flutter/material.dart';

class AppBarTextItem extends StatelessWidget {
  final text;
  final Function fun;
  AppBarTextItem({@required this.text,this.fun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: fun,
        child: Text(text,style: TextStyle(color: Colors.white,fontSize: 16.0,fontWeight: FontWeight.w600),));
  }
}

class BannerButton extends StatelessWidget {
  final IconData icon;
  final String title;
  BannerButton({this.title,this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon,color: Colors.white,),
        const SizedBox(height: 2.0,),
        Text(title,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
      ],
    );
  }
}


class PlayButton extends StatelessWidget {
  final double Size;
  final double w;
  PlayButton({this.Size,this.w});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: w,
      color: Colors.grey[850],
      child: FlatButton.icon(
        color: Colors.white,
        icon: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Icon(Icons.play_arrow,size: Size,color: Colors.white,),
        ),
        label: const Text('Play',style: const TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

List<int>l1=[
  1,3,6,12,4,13,18,2,8,9,14,16,11,12,15
];


