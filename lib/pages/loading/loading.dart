import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie/models/GetData.dart';
import 'package:movie/widgets/main_page.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';
import 'package:movie/repos/Movie.dart';

final loadingKey = GlobalKey<_LoadingState>();
class Loading extends StatefulWidget {
  Key key = loadingKey;
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  List<String> _movieUrlList = [
    'https://www.youtube.com/watch?v=1VIZ89FEjYI',
    'https://www.youtube.com/watch?v=wAJcykyq7DU',
    'https://www.youtube.com/watch?v=hSMokfUerVY',
    'https://www.youtube.com/watch?v=kP9TfCWaQT4',
    'https://www.youtube.com/watch?v=3od-kQMTZ9M',
    'https://www.youtube.com/watch?v=XW2E2Fnh52w',
    'https://www.youtube.com/watch?v=x5lrkdvEZGg',
    'https://www.youtube.com/watch?v=H1WYnJF1Pwo',
    'https://www.youtube.com/watch?v=vM-Bja2Gy04',
    'https://www.youtube.com/watch?v=JKNv2YfrM7Y',
    'https://www.youtube.com/watch?v=u8ZsUivELbs',
    'https://www.youtube.com/watch?v=1HZAnkxdYuA',
    'https://www.youtube.com/watch?v=t7FwypV69qc',
    'https://www.youtube.com/watch?v=2SvwX3ux_-8',
    'https://www.youtube.com/watch?v=gerLMlPWwQ0',
    'https://www.youtube.com/watch?v=YhIxOqv5Cs0',
    'https://www.youtube.com/watch?v=K41a_JkCM1U',
    'https://www.youtube.com/watch?v=mYxIu5Z0BO8',
    'https://www.youtube.com/watch?v=ccaNMcPqpQ0',
    'https://www.youtube.com/watch?v=Kw1u9PIbbt8',
  ];
  List<int> _runningTime = [
    125,
    100,
    90,
    89,
    125,
    90,
    95,
    100,
    125,
    95,
    125,
    100,
    124,
    115,
    90,
    100,
    124,
    125,
    96,
    150,
  ];
  List<Result> listResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
              child: FutureBuilder<Movie>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SpinKitThreeBounce(
                            color: Colors.red,
                            size: 50.0,
                          ),
                          SizedBox(height: 10),
                          Text('ការបើកដំណើរការកម្មវិធីត្រូវបានបរាជ័យ', style: TextStyle(
                            fontFamily: 'KhmerOSbattambang',
                            fontSize: 14,
                          ),),
                          Text('សូមព្យាយាមម្ដងទៀត', style: TextStyle(
                            fontFamily: 'KhmerOSbattambang',
                              fontSize: 14,
                          ),),
                          SizedBox(height: 20),
                          InkWell(
                            child: Icon(
                                Icons.refresh,
                                color: Colors.red, size: 40
                            ),
                            onTap: (){
                              setState(() {

                              });
                            },
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            child: Icon(Icons.close, color: Colors.red, size: 40),
                            onTap: (){
                              exit(0);
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    if (snapshot.connectionState == ConnectionState.done) {
                      listResult = snapshot.data.results;
                      _getData(listResult);
                      return MainPage();
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SpinKitFadingCircle(
                              color: Colors.red,
                              size: 60.0,
                            ),
                            SizedBox(height: 10),
                            Text('កំពុងដំណើរការ...', style: TextStyle(
                              fontFamily: 'KhmerOSbattambang',
                            ),),
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ),
      //),
    );
  }

  _getData(List<Result> result) {
    result[0].title = _movieUrlList[0];
    result[1].title = _movieUrlList[1];
    result[2].title = _movieUrlList[2];
    result[3].title = _movieUrlList[3];
    result[4].title = _movieUrlList[4];
    result[5].title = _movieUrlList[5];
    result[6].title = _movieUrlList[6];
    result[7].title = _movieUrlList[7];
    result[8].title = _movieUrlList[8];
    result[9].title = _movieUrlList[9];
    result[10].title = _movieUrlList[10];
    result[11].title = _movieUrlList[11];
    result[12].title = _movieUrlList[12];
    result[13].title = _movieUrlList[13];
    result[14].title = _movieUrlList[14];
    result[15].title = _movieUrlList[15];
    result[16].title = _movieUrlList[16];
    result[17].title = _movieUrlList[17];
    result[18].title = _movieUrlList[18];
    result[19].title = _movieUrlList[19];

    result[0].voteCount = _runningTime[0];
    result[1].voteCount = _runningTime[1];
    result[2].voteCount = _runningTime[2];
    result[3].voteCount = _runningTime[3];
    result[4].voteCount = _runningTime[4];
    result[5].voteCount = _runningTime[5];
    result[6].voteCount = _runningTime[6];
    result[7].voteCount = _runningTime[7];
    result[8].voteCount = _runningTime[8];
    result[9].voteCount = _runningTime[9];
    result[10].voteCount = _runningTime[10];
    result[11].voteCount = _runningTime[11];
    result[12].voteCount = _runningTime[12];
    result[13].voteCount = _runningTime[13];
    result[14].voteCount = _runningTime[14];
    result[15].voteCount = _runningTime[15];
    result[16].voteCount = _runningTime[16];
    result[17].voteCount = _runningTime[17];
    result[18].voteCount = _runningTime[18];
    result[19].voteCount = _runningTime[19];

    for (int i = 0; i < result.length; i++) {
      if (result[i].originalLanguage == 'en')
        result[i].originalLanguage = 'English';
      else if (result[i].originalLanguage == 'ko')
        result[i].originalLanguage = 'Korea';
      else if (result[i].originalLanguage == 'es')
        result[i].originalLanguage = 'Spanish';
      else if (result[i].originalLanguage == 'fr')
        result[i].originalLanguage = 'France';
      else if (result[i].originalLanguage == 'zh')
        result[i].originalLanguage = 'America';
      else if (result[i].originalLanguage == 'sv')
        result[i].originalLanguage = 'Thailand';
    }
  }

}
