import 'package:flutter/material.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';
import 'package:movie/utils/lock_rotation.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    lockRotation();
    return Scaffold(
      appBar: _buildAppBar,
      extendBodyBehindAppBar: true,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 0.0),
          colors: <Color>[
            Colors.red,
            Colors.white,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 230,
                      width: 220,
                      child: Image.asset('assets/logo (1).png'),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Text(
                        'SERVICES          QUALITY       RESPONSIVE',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 45,
                width: 200,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.red,
                  child: Text(
                    'START NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MultiPages()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
