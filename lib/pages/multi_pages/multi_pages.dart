import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie/pages/cinemas/cinema.dart';
import 'package:movie/pages/contact_us/contact_us.dart';
import 'package:movie/pages/faviorite/faviorite.dart';
import 'package:movie/pages/food_and_drink/food_and_drink.dart';
import 'package:movie/pages/history/history.dart';
import 'package:movie/pages/movies/movie.dart';
import 'package:movie/utils/launch_url.dart';
import 'package:movie/widgets/build_appBar.dart';

class MultiPages extends StatefulWidget {
  @override
  _MultiPagesState createState() => _MultiPagesState();
}

class _MultiPagesState extends State<MultiPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
    );
  }
}

final GlobalKey<_HomeState> multiPagesKey = GlobalKey<_HomeState>();

class Home extends StatefulWidget {
  final Key key = multiPagesKey;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController _controller = new PageController();
  List<Widget> _pageList = List<Widget>();
  Movies _homeScreen = Movies();
  Cinema _cinema = Cinema();
  FoodAndDrink _foodAndDrink = FoodAndDrink();
  int _currentIndex = 0;
  int movieCountClicked = 1;
  int cinemaCountClicked = 1;
  bool _login = false;
  bool _movie = true;
  bool _ci = false;
  bool _fa = false;
  bool _his = false;
  bool _aboutUs = false;
  bool _social = false;
  bool _fad = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    _pageList = [
      _homeScreen,
      _cinema,
      _foodAndDrink,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppBar(context),
      endDrawer: _buildDrawer,
      bottomNavigationBar: _buildBottomNavigationBar,
      body: _buildBody,
    );
  }

  get _buildBody{
    return PageView(
      controller: _controller,
      children: _pageList,
      onPageChanged: (int index){
        index == 0 ? movieCountClicked += 1 : movieCountClicked = 0;
        index == 1 ? cinemaCountClicked += 1 : cinemaCountClicked = 0;
        setState(() {
          _currentIndex = index;
          if(index == 0){
            _movie = true;
            _login = false;
            _ci = false;
            _fa = false;
            _his = false;
            _aboutUs = false;
            _social = false;
            _fad = false;
          }
          else if(index == 1){
            _movie = false;
            _login = false;
            _ci = true;
            _fa = false;
            _his = false;
            _aboutUs = false;
            _social = false;
            _fad = false;
          }
          else if(index == 2){
            _movie = false;
            _login = false;
            _ci = false;
            _fad = true;
            _his = false;
            _aboutUs = false;
            _social = false;
          }
        });
      },
    );
  }

  get _buildDrawer{
    return OrientationBuilder(
        builder: (context, orientation) {
          return Drawer(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      height: orientation == Orientation.portrait ? 170 : 150,
                      padding: orientation == Orientation.portrait ? EdgeInsets.only(top: 60) : EdgeInsets.only(top: 30),
                      child: Center(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 40,
                              backgroundImage: AssetImage('assets/logo (1).png'),
                            ),
                            SizedBox(height: 5),
                            Text('LUXURY', style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: orientation == Orientation.portrait ? (MediaQuery.of(context).size.height - 170) : (MediaQuery.of(context).size.height - 150),
                      child: ListView(
                        children: [
                          Card(
                            color: _movie ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _movie = true;
                                  _login = false;
                                  _ci = false;
                                  _fa = false;
                                  _his = false;
                                  _aboutUs = false;
                                  _social = false;
                                  _fad = false;
                                  _currentIndex = 0;
                                  _controller.jumpToPage(0);
                                });
                              },
                              leading: CircleAvatar(
                                backgroundColor: _movie ? Colors.black : Colors
                                    .red,
                                radius: 20,
                                child: Icon(Icons.movie),
                              ),
                              title: Text('Movies', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _ci ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _ci = true;
                                  _login = false;
                                  _movie = false;
                                  _fa = false;
                                  _his = false;
                                  _aboutUs = false;
                                  _social = false;
                                  _fad = false;
                                  _currentIndex = 1;
                                  _controller.jumpToPage(1);
                                });
                              },
                              leading: CircleAvatar(
                                backgroundColor: _ci ? Colors.black : Colors.red,
                                radius: 20,
                                child: Icon(Icons.shop),
                              ),
                              title: Text('Cinemas', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _fad ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _ci = false;
                                  _login = false;
                                  _movie = false;
                                  _fad = true;
                                  _his = false;
                                  _aboutUs = false;
                                  _social = false;
                                  _currentIndex = 2;
                                  _controller.jumpToPage(2);
                                });
                              },
                              leading: CircleAvatar(
                                backgroundColor: _fad ? Colors.black : Colors.red,
                                radius: 20,
                                child: Icon(Icons.fastfood),
                              ),
                              title: Text('Food and Drink', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _fa ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _ci = false;
                                  _login = false;
                                  _movie = false;
                                  _fa = true;
                                  _his = false;
                                  _aboutUs = false;
                                  _social = false;
                                  _currentIndex = 2;
                                  _fad = false;
                                  // _controller.jumpToPage(2);
                                });
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Favorite()));
                              },
                              leading: CircleAvatar(
                                backgroundColor: _fa ? Colors.black : Colors.red,
                                radius: 20,
                                child: Icon(Icons.favorite),
                              ),
                              title: Text('Favorite Movies', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _his ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _ci = false;
                                  _login = false;
                                  _movie = false;
                                  _fa = false;
                                  _his = true;
                                  _aboutUs = false;
                                  _social = false;
                                  _fad = false;
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => History()));
                                });
                              },
                              leading: CircleAvatar(
                                backgroundColor: _his ? Colors.black : Colors.red,
                                radius: 20,
                                child: Icon(Icons.history),
                              ),
                              title: Text('History', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _aboutUs ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _ci = false;
                                  _login = false;
                                  _movie = false;
                                  _fa = false;
                                  _his = false;
                                  _aboutUs = true;
                                  _social = false;
                                  _fad = false;
                                });
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUs()));
                              },
                              leading: CircleAvatar(
                                backgroundColor: _aboutUs ? Colors.black : Colors
                                    .red,
                                radius: 20,
                                child: Icon(Icons.people_outline_rounded),
                              ),
                              title: Text('Contact Us', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _social ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _ci = false;
                                  _login = false;
                                  _movie = false;
                                  _fa = false;
                                  _his = false;
                                  _aboutUs = false;
                                  _social = true;
                                  _fad = false;
                                });
                                launchURL('https://www.facebook.com/chhean.brosna.3');
                              },
                              leading: CircleAvatar(
                                backgroundColor: _social ? Colors.black : Colors
                                    .red,
                                radius: 20,
                                child: Icon(Icons.share),
                              ),
                              title: Text('Social', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                          Card(
                            color: _login ? Colors.red : Colors.black,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  Navigator.pop(context);
                                  _login = true;
                                  _movie = false;
                                  _ci = false;
                                  _fa = false;
                                  _his = false;
                                  _aboutUs = false;
                                  _social = false;
                                  _fad = false;
                                });
                                exit(0);
                              },
                              leading: CircleAvatar(
                                backgroundColor: _login ? Colors.black : Colors
                                    .red,
                                radius: 20,
                                child: Icon(Icons.login),
                              ),
                              title: Text('Exit', style: TextStyle(
                                  color: Colors.white, fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
          );
        }
    );
  }

  get _buildBottomNavigationBar{
    return BottomNavigationBar(
      onTap: (int index){
        setState(() {
          _currentIndex = index;
          index == 0 ? movieCountClicked += 1 : movieCountClicked = 0;
          movieCountClicked == 2 ? movieScreenKey.currentState.movieGotoTop() : null;
          movieCountClicked == 2 ? movieCountClicked -= 1 : null;

          index == 1 ? cinemaCountClicked += 1 : cinemaCountClicked = 0;
          cinemaCountClicked == 2 ? cinemaScreenKey.currentState.cinemaGotoTop() : null;
          cinemaCountClicked == 2 ? cinemaCountClicked -= 1 : null;
        });
        _controller.animateToPage(_currentIndex, duration: Duration(microseconds: 200), curve: Curves.easeInOut);
      },
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.red,
      currentIndex: _currentIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Movie',
          icon: Icon(Icons.movie),
        ),
        BottomNavigationBarItem(
          label: 'Cinema',
          icon: Icon(Icons.shop),
        ),
        BottomNavigationBarItem(
          label: 'F & D',
          icon: Icon(Icons.fastfood),
        ),
      ],
    );
  }

  double subHeight(){
    return AppBar().preferredSize.height + MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;
  }
}


