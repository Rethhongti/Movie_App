import 'package:flutter/material.dart';
import 'package:movie/models/GetData.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/movies/movie_local_widget/build_listView.dart';
import 'package:movie/pages/loading/loading.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';
import 'package:movie/repos/Movie.dart';
import 'package:movie/utils/goto_top.dart';
import 'package:movie/utils/lock_rotation.dart';
import 'package:provider/provider.dart';

final GlobalKey<_MoviesState> movieScreenKey = GlobalKey<_MoviesState>();

class Movies extends StatefulWidget {
  final Key key = movieScreenKey;
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> with AutomaticKeepAliveClientMixin {
  final String imageUrl = 'https://image.tmdb.org/t/p/original/';
  ScrollController _scrollController = ScrollController();
  bool hearthClicked = false;
  Future<Movie> _data;
  List<Result> listResult = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getData();
  }

  @override
  Widget build(BuildContext context) {
    lockRotation();
    return ChangeNotifierProvider(
      create: (context) => MyModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _buildBody,
      ),
    );
  }

  get _buildBody {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft,
            height: 45,
            width: double.infinity,
            color: Colors.red,
            child: Text(
              'Movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height -
                kBottomNavigationBarHeight -
                multiPagesKey.currentState.subHeight() -
                45),
            child: buildListView(
                loadingKey.currentState.listResult, _scrollController),
          ),
        ],
      ),
    );
  }

  void movieGotoTop() {
    gotoTop(_scrollController);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
