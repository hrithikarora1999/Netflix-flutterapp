import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Content {
  final String name;
  final String imagePosterUrl;
  final String imageRowurl;
  final String date;
  final bool adult;
  final double rating;
 // final String titleImageUrl;
  //final String videoUrl;
  final String description;
  //final Color color;

  const Content({
    this.name,
    this.imagePosterUrl,
    //this.titleImageUrl,
    this.imageRowurl,
    this.description,
    this.date,
    this.adult=false,
    this.rating=95,
    //this.color,
  });
}
