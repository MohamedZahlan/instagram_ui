import 'package:flutter/material.dart';

class PostModel {
  String ProfileImage;
  String PostImage;
  String Username;
  String Date;
  Icon icon0;
  Icon icon1;
  num likes;
  Icon icon2;
  dynamic comments;
  Icon icon3;
  PostModel(
    this.ProfileImage,
    this.PostImage,
    this.Username,
    this.Date,
    this.icon0,
    this.icon1,
    this.likes,
    this.icon2,
    this.comments,
    this.icon3,
  );
}
