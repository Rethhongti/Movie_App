import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/faviorite/faviorite.dart';
import 'package:movie/pages/movies/movie.dart';
import 'package:movie/pages/movies/movie_detail_local_widget/positioned_widget.dart';
import 'package:movie/repos/Movie.dart';
import 'package:movie/utils/lock_rotation.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  final Result result;
  MovieDetail({this.result});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

bool favClicked = false;

class _MovieDetailState extends State<MovieDetail> {
  final String imageUrl = 'https://image.tmdb.org/t/p/original/';

  @override
  Widget build(BuildContext context) {
    lockRotation();
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: _buildAppBar,
        extendBodyBehindAppBar: true,
        body: _buildBody,
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      elevation: 0.0,
      title: Text(
        'DETAIL',
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          movieScreenKey.currentState.setState(() {});
          favClicked ? favoriteKey.currentState.setState(() {}) : null;
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.white,
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  get _buildBody {
    return OrientationBuilder(builder: (context, orientation) {
      return Stack(
        children: [
          Hero(
            tag: '${widget.result.posterPath}',
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                imageUrl: '$imageUrl${widget.result.posterPath}',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Definition(orientation: orientation, result: widget.result),
        ],
      );
    });
  }
}
