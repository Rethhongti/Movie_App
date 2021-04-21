import 'package:flutter/material.dart';
import 'package:movie/pages/faviorite/faviorite.dart';
import 'package:movie/pages/movies/movie.dart';
import 'package:movie/pages/movies/movie_detail.dart';
import 'package:movie/repos/Movie.dart';


Future<Result> buyAlertDialog(context, Result result) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.red,
        title: Text(
          'បញ្ចាក់ប្រតិបត្តិការ',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'KhmerOSbattambang',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Stack(
          children: [
            Container(
              color: Colors.black,
              height: 300,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: ('ចំណងជើង : '),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'KhmerOSbattambang',
                        ),
                        children: [
                          TextSpan(
                            text:
                            '${result.originalTitle.length > 15 ? '${result.originalTitle.toUpperCase().substring(0, 15)}' : '${result.originalTitle.toUpperCase().substring(0, result.originalTitle.length)}'}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: ('តម្លៃ​ឯកតា : '),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                            fontFamily: 'KhmerOSbattambang',
                        ),
                        children: [
                          TextSpan(
                            text: '\$${result.voteCount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: ('តម្លៃពន្ទដារ : '),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'KhmerOSbattambang',
                        ),
                        children: [
                          TextSpan(
                            text: '\$${0.0}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: ('តម្លៃដឹកជញ្ចួន : '),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'KhmerOSbattambang',
                        ),
                        children: [
                          TextSpan(
                            text: '\$${0.0}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Colors.white,
                      height: 10,
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: ('តម្លៃសរុប : '),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'KhmerOSbattambang',
                        ),
                        children: [
                          TextSpan(
                            text: '\$${result.voteCount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: (MediaQuery.of(context).size.width - 130 - 40) * 0.4,
              child: Container(
                width: 100,
                child: RaisedButton(
                  color: Colors.red,
                  child: Text(result.video == true ? 'បោះបង់' :
                    'បញ្ជាក់',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'KhmerOSbattambang',
                    ),
                  ),
                  onPressed: () {
                    movieScreenKey.currentState.setState(() {

                    });
                    favClicked ? favoriteKey.currentState.setState(() {

                    }) : null;
                    result.video = !result.video;
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

