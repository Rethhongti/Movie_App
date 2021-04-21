import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/movies/movie_detail.dart';
import 'package:movie/pages/movies/movie_local_widget/buy_alertDialog.dart';
import 'package:movie/utils/launch_url.dart';
import 'package:provider/provider.dart';

final String _imageUrl = 'https://image.tmdb.org/t/p/original/';
Widget buildItemBuilder(BuildContext context, movie){
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 160,
            width: 120,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider('$_imageUrl${movie.posterPath}',),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 50,
                  child: InkWell(
                    onTap: (){
                      launchURL('${movie.title}');
                    },
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.grey, size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 160,
            width: (MediaQuery.of(context).size.width - 120) * 0.7,
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        movie.originalTitle.length > 15
                            ? '${movie.originalTitle.toUpperCase().substring(0, 15)}'
                            : '${movie.originalTitle.toUpperCase().substring(0, movie.originalTitle.length)}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: Text(
                        'Language: ${movie.originalLanguage}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Running Time: ${movie.voteCount} minutes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          favClicked = false;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieDetail(result: movie)));
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          color: Colors.white,
                          child: Icon(
                            Icons.details,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          Provider.of<MyModel>(context, listen: false).changeAdult(movie);
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          color: Colors.white,
                          child: Consumer<MyModel>(
                              builder: (context, myModel, child){
                                return Icon(
                                  Icons.favorite,
                                  color: movie.adult ? Colors.red : Colors.black,
                                );
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width - 120) * 0.3,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              radius: 30,
              child: IconButton(
                icon: Icon(movie.video == true ? Icons.check : Icons.add_shopping_cart_outlined),
                color: Colors.white,
                iconSize: movie.video == true ? 32 : 24,
                onPressed: () {
                  // setState(() {
                  favClicked = false;
                  // });
                  buyAlertDialog(context, movie);
                },
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      Divider(color: Colors.white),
    ],
  );
}