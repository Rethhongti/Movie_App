import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/launch_url.dart';

Widget buildLocation(subHeight){
  return InkWell(
    onTap: (){
      launchURL('https://goo.gl/maps/GCNbPccyCuWjUUwz9');
    },
    child: CachedNetworkImage(
      imageUrl: 'https://c1.10times.com/map/venue/67298.png',
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height - subHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white,width: 1),
          color: Colors.red,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white,width: 1),
          color: Colors.red,
        ),
        child: Center(child: CircularProgressIndicator()),
        height: MediaQuery.of(context).size.height - subHeight,
        // width: 150,
      ),
      errorWidget: (context, url, error) => Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white,width: 1),
          color: Colors.red,
        ),
        child: Icon(Icons.error),
        height: MediaQuery.of(context).size.height - subHeight,
        // width: 150,
      ),
    ),
  );
}