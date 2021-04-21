import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/CinemaData.dart';
import 'package:movie/models/MyModel.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/build_appBar.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/build_gridView.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/build_itemBuilder.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/cinema_info.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/new_button.dart';
import 'package:movie/pages/cinemas/cinema_detail_local_widgets/seat_info.dart';
import 'package:movie/pages/cinemas/cinema_next.dart';
import 'package:provider/provider.dart';

class CinemaDetail extends StatefulWidget {

  final int index;
  CinemaDetail({this.index});

  @override
  _CinemaDetailState createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {

  bool isClicked = false;
  int clickedCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<MyModel>(
        create: (context) => MyModel(),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: buildAppBar(context),
          body: OrientationBuilder(
            builder: (context, orientation){
              return Container(
                child: orientation == Orientation.portrait ? _buildBody : _buildBodyLandScape,
              );
            }
          ),
        ),
      ),
    );
  }

  get _buildBody{
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cinemaInfo(context, cinemaList[widget.index]),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: (MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom - 80 - 250 - 65),
            child: buildGridView(seatData),
          ),
          seatInfo(context, seatData),
          nextButton(context),
        ],
      ),
    );
  }

  get _buildBodyLandScape{
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Container(
            width: 550,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                  children: [
                      Container(
                        height: 245,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: '${cinemaList[widget.index]['image']}',
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${cinemaList[widget.index]['name']}', style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 10),
                            Text('Phnom Penh', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 10),
                            Text('Open : ${cinemaList[widget.index]['open']}', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 10),
                            Text('Close : ${cinemaList[widget.index]['close']}', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 10),
                            Text('Contact Us : ${cinemaList[widget.index]['contact']}', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text('Location', style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                ),),
                                Icon(Icons.edit_location, color: Colors.red,),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 250,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 12,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      //childAspectRatio: 1
                    ),
                    itemBuilder: (BuildContext context, index) =>
                        buildItemBuilder(seatData[index], index, context),
                    itemCount: seatData.length,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 60,
                  child: Consumer<MyModel>(
                    builder: (context, myModel, child){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.red,
                            height: 20,
                            child: Text('Seat(s) selected : ${myModel.clickedCount}', style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                          Container(
                            // color: Colors.blue,
                            height: 20,
                            child: Text('Available seat to be selected : ${seatData.length - myModel.clickedCount}/${seatData.length}', style: TextStyle(
                              color: Colors.white,
                            )),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                // SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CinemaNext()));
                  },
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.red,
                      child: Text('Next'),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
