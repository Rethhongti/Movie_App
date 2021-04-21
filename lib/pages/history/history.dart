import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:movie/pages/history/history_local_widgets/build_appBar.dart';
import 'package:movie/pages/loading/loading.dart';
import 'package:movie/pages/movies/movie.dart';
import 'package:movie/repos/Movie.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<Result> _listResult = List<Result>();
  final String imageUrl = 'https://image.tmdb.org/t/p/original/';
  String searchText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBoughtData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding : false,
      backgroundColor: Colors.black,
      appBar: buildAppBar(context),
      body: _buildBody,
    );
  }

  String date = DateFormat("dd-MMMM-yyyy").format(DateTime.now());
  bool isTrue = true;
  List<Result> subData = [];
  int count = 0;

  get _buildBody {
    double subHeight = AppBar().preferredSize.height + MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom + 45 + 30 + 60;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 45,
              child: Form(
                child: Container(
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
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 30,
              child: Text(
                '$date',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: (MediaQuery.of(context).size.height - subHeight),
              width: double.infinity,
              child: ListView.builder(
                itemCount:
                    searchText.isEmpty ? _listResult.length : subData.length,
                itemBuilder: (context, index) => _buildItemBuilder(searchText.isEmpty ? _listResult[index] : subData[index], index, _listResult[index].originalTitle),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
              height: 60,
              child: InkWell(
                onTap: () {
                    _listResult.clear();
                    setState(() {
                      for (int i = 0; i < loadingKey.currentState.listResult.length; i++) {
                        if (loadingKey.currentState.listResult[i].video == true)
                          loadingKey.currentState.listResult[i].video = false;
                      }
                      },
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Text(
                      'ជម្រះទិន្នន័យរុករក',
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'KhmerOSbattambang',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBoughtData() {
    for (int i = 0; i < loadingKey.currentState.listResult.length; i++) {
      if (loadingKey.currentState.listResult[i].video == true)
        _listResult.add(loadingKey.currentState.listResult[i]);
    }
  }

  _buildItemBuilder(Result result, index, title) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Card(
        color: Colors.black,
        elevation: 0.0,
        child: Container(
          height: 52,
          padding: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(
              Icons.movie,
              color: Colors.white,
            ),
            title: Text(
              '${result.originalTitle}',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            trailing: Text(
              'បានទិញ',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'KhmerOSbattambang',
              ),
            ),
          ),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.white,
          icon: Icons.delete,
          onTap: (){
            setState(() {
              _listResult.removeAt(index);
              for (int i = 0; i < loadingKey.currentState.listResult.length; i++) {
                if (loadingKey.currentState.listResult[i].originalTitle == title)
                  loadingKey.currentState.listResult[i].video = false;
              }
            });
          }
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.white,
          icon: Icons.delete,
            onTap: (){
              setState(() {
                _listResult.removeAt(index);
                for (int i = 0; i < loadingKey.currentState.listResult.length; i++) {
                  if (loadingKey.currentState.listResult[i].originalTitle == title)
                    loadingKey.currentState.listResult[i].video = false;
                }
              });
            }
        ),
      ],
    );
  }
}
