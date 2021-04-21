import 'package:flutter/material.dart';
import 'package:movie/models/CinemaData.dart';
import 'package:movie/pages/cinemas/cinema_local_widgets/build_gridView.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';
import 'package:movie/utils/goto_top.dart';

final cinemaScreenKey = GlobalKey<_CinemaState>();

class Cinema extends StatefulWidget {

  final Key key = cinemaScreenKey;
  @override
  _CinemaState createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> with AutomaticKeepAliveClientMixin{

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            color: Colors.black,
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
                    'Cinema',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height - kBottomNavigationBarHeight -
                      multiPagesKey.currentState
                          .subHeight() - 45),
                  color: Colors.black,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      setState(() {});
                    },
                    child: buildGridView(orientation, _scrollController, cinemaList),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  cinemaGotoTop() {
    gotoTop(_scrollController);
  }

}
