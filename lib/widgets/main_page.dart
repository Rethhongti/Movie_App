import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/loading/loading.dart';
import 'package:movie/pages/multi_pages/multi_pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(10)),
            //     image: DecorationImage(
            //       image: CachedNetworkImageProvider('https://i.pinimg.com/originals/4f/3a/c4/4f3ac4124a23dd6af0181bced3fdacd3.jpg'),
            //       fit: BoxFit.cover,
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.red,
            //         offset: Offset(8, 8),
            //         blurRadius: 15.0,
            //         spreadRadius: 1,
            //       ),
            //     ],
            //   ),
            //   height: 300,
            //   width: 200,
            // ),
            Image.asset('assets/logo (1).png'),
            // CachedNetworkImage(
            //   imageUrl: 'https://i.pinimg.com/originals/4f/3a/c4/4f3ac4124a23dd6af0181bced3fdacd3.jpg',
            //   imageBuilder: (context, imageProvider) => Container(
            //     margin: EdgeInsets.only(right: 12),
            //     height: 300,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       image: DecorationImage(
            //         image: imageProvider,
            //         fit: BoxFit.cover,
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.red,
            //           offset: Offset(8, 8),
            //           blurRadius: 15.0,
            //           spreadRadius: 1,
            //         ),
            //       ],
            //     ),
            //   ),
            //   placeholder: (context, url) => Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.red,
            //           offset: Offset(8, 8),
            //           blurRadius: 15.0,
            //           spreadRadius: 1,
            //         ),
            //       ],
            //     ),
            //     child: Center(child: CircularProgressIndicator()),
            //     height: 300,
            //     width: 200,
            //   ),
            //   errorWidget: (context, url, error) => Container(
            //     decoration: BoxDecoration(
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.red,
            //           offset: Offset(8, 8),
            //           blurRadius: 15.0,
            //           spreadRadius: 1,
            //         ),
            //       ],
            //       borderRadius: BorderRadius.all(Radius.circular(10)),
            //     ),
            //     child: Icon(Icons.error),
            //     height: 300,
            //     width: 200,
            //   ),
            // ),
            SizedBox(height: 30),
            Container(
              // height: 50,
              child: Text(
                'SERVICES          QUALITY       RESPONSIVE',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(right: 11),
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'ចាប់ផ្តើម',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'KhmerOSbattambang',
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).pushReplacementNamed('/loading');
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MultiPages()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
