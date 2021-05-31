import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/cinemas/cinema_detail.dart';

Widget buildItemBuilder(context, cinemaList, index) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CinemaDetail(index: index)));
    },
    child: Hero(
      tag: '${cinemaList['image']}',
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 5, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: CachedNetworkImage(
          imageUrl: '${cinemaList['image']}',
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
