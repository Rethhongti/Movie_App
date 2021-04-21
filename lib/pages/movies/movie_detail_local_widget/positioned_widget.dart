import 'package:flutter/material.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/movies/movie_local_widget/buy_alertDialog.dart';
import 'package:movie/repos/Movie.dart';
import 'package:provider/provider.dart';

class Definition extends StatelessWidget {

  final Orientation orientation;
  final Result result;
  Definition({this.orientation, this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        bottom: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.black.withOpacity(0.7),
          ),
          height: orientation == Orientation.portrait ? MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                height: orientation == Orientation.portrait ? (MediaQuery.of(context).size.height) * 0.4 : (MediaQuery.of(context).size.height) * 0.45,
                width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width :
                MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 220,
                            child: Text(
                              '${result.originalTitle}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text('${result.releaseDate}'.substring(0, 10),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: orientation == Orientation.portrait ? 30 : 10),
                      Text(
                        '${result.overview}',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: orientation == Orientation.portrait ? (MediaQuery.of(context).size.height) * 0.1 : (MediaQuery.of(context).size.height) * 0.15,
                width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width :
                MediaQuery.of(context).size.width - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
                child: Row(
                  children: [
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          buyAlertDialog(context, result);
                        },
                        child: Text(
                          'បន្ត',
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            fontFamily: 'KhmerOSbattambang',
                          ),
                        ),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      width: orientation == Orientation.portrait ? (MediaQuery.of(context).size.width - 10 - 45 - 10 - 5) :
                      (MediaQuery.of(context).size.width - 10 - 45 - 10 - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom),
                      height: 45,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(width: 10),
                    Consumer<MyModel>(
                        builder: (context, myModel, child){
                          return Container(
                            decoration: BoxDecoration(
                              color: result.adult ? Colors.red : Colors
                                  .white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                            ),
                            width: 45,
                            height: 45,
                            child: IconButton(
                              onPressed: () {
                                Provider.of<MyModel>(context, listen: false).changeAdult(result);
                              },
                              icon: Icon(
                                  Icons.favorite,
                                  color: result.adult ? Colors.white : Colors.black
                              ),
                            ),
                            margin:  EdgeInsets.only(bottom: 5),
                          );
                        }
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
