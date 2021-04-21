import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/loading/loading.dart';
import 'package:movie/pages/movies/movie.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';
import 'package:movie/repos/Movie.dart';
import 'package:movie/utils/launch_url.dart';
import 'package:url_launcher/url_launcher.dart';
import '../movies/movie_local_widget/buy_alertDialog.dart';
import '../movies/movie_detail.dart';

final favoriteKey = GlobalKey<_FavoriteState>();

class Favorite extends StatefulWidget {
  final Key key = favoriteKey;
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  final String imageUrl = 'https://image.tmdb.org/t/p/original/';
  ScrollController _scrollController = ScrollController();
  bool hearthClicked = false;
  List<Result> _listResult = List<Result>();

  @override
  Widget build(BuildContext context) {
    _getFavoriteDate();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar{
    return AppBar(
      backgroundColor: Colors.black,
      title: Text('My Favorite'),
      centerTitle: true,
    );
  }

  List<Result> subData = [];
  String searchText = '';
  get _buildBody {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Form(
              child: Container(
                height: 46,
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                alignment: Alignment.center,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      subData = _listResult
                          .where((result) => result.originalTitle
                          .toLowerCase()
                          .startsWith(value.toLowerCase()))
                          .toList();
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: ' Search',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height - multiPagesKey.currentState.subHeight() - 45),
              child: _buildListView(_listResult),
            ),
          ],
        ),
      ),
    );
  }

  _buildListView(List<Result> result) {
    return Container(
      color: Colors.black,
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          controller: _scrollController,
          itemCount: searchText.isEmpty ? result.length : subData.length,
          itemBuilder: (context, index) => _buildItemBuilder(searchText.isEmpty ? result[index] : subData[index]),
        ),
      ),
    );
  }

  _buildItemBuilder(Result movie) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                launchURL('${movie.title}');
              },
              child: Container(
                height: 160,
                width: 120,
                child: Container(
                  margin: EdgeInsets.only(left: 10, top: 5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          '$imageUrl${movie.posterPath}'),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                ),
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
                            setState(() {
                              favClicked = true;
                            });
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
                            setState(() {
                              movie.adult = !movie.adult;
                              movieScreenKey.currentState.setState(() {
                                // do this because to set The movie state to refresh the favorite
                              });
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            color: Colors.white,
                            child: Icon(
                              Icons.favorite,
                              color: movie.adult ? Colors.red : Colors.black,
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
                    setState(() {
                      favClicked = true;
                    });
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


  _getFavoriteDate(){
    _listResult.clear();
    for(int i = 0;i<loadingKey.currentState.listResult.length;i++){
      if(loadingKey.currentState.listResult[i].adult == true){
          _listResult.add(loadingKey.currentState.listResult[i]);
      }
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
