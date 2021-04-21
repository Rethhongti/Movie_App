import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/faviorite/faviorite.dart';
import 'package:movie/pages/movies/movie.dart';
import 'package:movie/pages/movies/movie_detail_local_widget/positioned_widget.dart';
import 'package:movie/repos/Movie.dart';
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
      title: Text('DETAIL', style: TextStyle(color: Colors.white),),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          movieScreenKey.currentState.setState(() {

          });
          favClicked ? favoriteKey.currentState.setState(() {

          }) : null;
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

  get _buildBody{
    return OrientationBuilder(
      builder: (context, orientation) {
        return Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                imageUrl: '$imageUrl${widget.result.posterPath}',
                placeholder: (context, url) =>
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
              ),
            ),
            Definition(orientation: orientation, result: widget.result),
            // Positioned(
            //   bottom: 1,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            //       color: Colors.black.withOpacity(0.7),
            //     ),
            //     height: orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.height * 0.6,
            //     width: MediaQuery.of(context).size.width,
            //     child: Column(
            //       children: [
            //         Container(
            //           padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
            //           height: orientation == Orientation.portrait ? (MediaQuery.of(context).size.height) * 0.4 : (MediaQuery.of(context).size.height) * 0.45,
            //           width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width :
            //             MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            //           child: SingleChildScrollView(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     SizedBox(
            //                       width: 220,
            //                       child: Text(
            //                         '${widget.result.originalTitle}',
            //                         style: TextStyle(
            //                           color: Colors.white,
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Text('${widget.result.releaseDate}'.substring(0, 10),
            //                       style: TextStyle(
            //                         color: Colors.white,
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(height: orientation == Orientation.portrait ? 30 : 10),
            //                 Text(
            //                   '${widget.result.overview}',
            //                   style: TextStyle(
            //                     color: Colors.red,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Container(
            //           alignment: Alignment.bottomCenter,
            //           height: orientation == Orientation.portrait ? (MediaQuery.of(context).size.height) * 0.1 : (MediaQuery.of(context).size.height) * 0.15,
            //           width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width :
            //             MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            //           child: Row(
            //             children: [
            //               Container(
            //                 child: RaisedButton(
            //                   onPressed: () {
            //                     buyAlertDialog(context, widget.result);
            //                   },
            //                   child: Text(
            //                     'បន្ត',
            //                     style: TextStyle(color: Colors.white,
            //                       fontWeight: FontWeight.bold,
            //                       fontSize: 16,
            //                       fontFamily: 'KhmerOSbattambang',
            //                     ),
            //                   ),
            //                   color: Colors.red,
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius: BorderRadius.circular(25),
            //                   ),
            //                 ),
            //                 width: orientation == Orientation.portrait ? (MediaQuery.of(context).size.width - 10 - 45 - 10 - 5) :
            //                   (MediaQuery.of(context).size.width - 10 - 45 - 10 - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom),
            //                 height: 45,
            //                 padding: EdgeInsets.only(left: 15),
            //                 margin: EdgeInsets.only(bottom: 5),
            //               ),
            //               SizedBox(width: 10),
            //               Consumer<MyModel>(
            //                   builder: (context, myModel, child){
            //                     return Container(
            //                       decoration: BoxDecoration(
            //                         color: widget.result.adult ? Colors.red : Colors
            //                             .white,
            //                         borderRadius: BorderRadius.all(
            //                             Radius.circular(10)),
            //                       ),
            //                       width: 45,
            //                       height: 45,
            //                       child: IconButton(
            //                         onPressed: () {
            //                           Provider.of<MyModel>(context, listen: false).changeAdult(widget.result);
            //                         },
            //                         icon: Icon(
            //                           Icons.favorite,
            //                           color: widget.result.adult ? Colors.white : Colors.black
            //                         ),
            //                       ),
            //                       margin:  EdgeInsets.only(bottom: 5),
            //                     );
            //                   }
            //               ),
            //               SizedBox(width: 10),
            //             ],
            //           ),
            //         ),
            //         // SizedBox(height: 20),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        );
      }
    );
  }
}
