import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/contact_us/contact_us_local_widgets/build_appBar.dart';
import 'package:movie/pages/contact_us/contact_us_local_widgets/build_location.dart';
import 'package:movie/pages/contact_us/contact_us_local_widgets/build_perosnalInfo.dart';
import 'package:movie/pages/contact_us/contact_us_local_widgets/build_setMessage.dart';
import 'package:movie/utils/launch_url.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

  bool callClicked = false;
  bool mailClicked = false;
  bool locationClicked = false;
  bool moreClicked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: buildAppBar(context),
        body: OrientationBuilder(
          builder: (context, orientation){
            return orientation == Orientation.portrait ? _buildBody : _buildBodyLandScape;
          }
        ),
      ),
    );
  }

  get _buildBody{
    double subHeight = AppBar().preferredSize.height + MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom + 380 + 60 + 10 + 45 + 20;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            buildPersonalInfo(),
            Container(
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.red,
              ),
              height: 60,
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      createPhoneCallDialog(context);
                      setState(() {
                        callClicked = true;
                        mailClicked = false;
                        locationClicked = false;
                        moreClicked = false;
                      });
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.call, size: 30, color: Colors.white,),
                      radius: 25,
                      backgroundColor: callClicked ? Colors.black : Colors.transparent,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      launchURL('mailto:chheanbrosna101@gmail.com');
                      setState(() {
                        callClicked = false;
                        mailClicked = true;
                        locationClicked = false;
                        moreClicked = false;
                      });
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.mail, size: 30, color: Colors.white,),
                      radius: 25,
                      backgroundColor: mailClicked ? Colors.black : Colors.transparent,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        callClicked = false;
                        mailClicked = false;
                        locationClicked = true;
                        moreClicked = false;
                      });
                      launchURL('https://goo.gl/maps/GCNbPccyCuWjUUwz9');
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.location_on, size: 30, color: Colors.white,),
                      radius: 25,
                      backgroundColor: locationClicked ? Colors.black : Colors.transparent,
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      launchURL('sms:093 65 15 13');
                      setState(() {
                        callClicked = false;
                        mailClicked = false;
                        locationClicked = false;
                        moreClicked = true;
                      });
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.more_horiz, size: 30, color: Colors.white,),
                      radius: 25,
                      backgroundColor: moreClicked ? Colors.black : Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            buildLocation(subHeight),
            buildSetMessage(),
          ],
        ),
      ),
    );
  }

  get _buildBodyLandScape{
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 370,
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Contact us', style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                ),),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text('Get help and support, troubleshoot your', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 3),
                            Text('services or get in touch with us', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 40),
                            Text('Email', style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 4),
                            Text('chheanbrosna101@gmail.com', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 40),
                            Text('Phone Number', style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 4),
                            Text('+855 93 65 15 13', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            SizedBox(height: 40),
                            Text('Address', style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 4),
                            Text('PresBroSob Village, PresBroSob Commune, KhsachKondal District and Kandal Province', style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: CachedNetworkImage(
                          imageUrl: 'https://i.pinimg.com/originals/62/e5/61/62e5614d21b6ab1dc7b61664b1b97ebc.jpg',
                          imageBuilder: (context, imageProvider) => Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.white,width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red,
                                  offset: Offset(2, 4),
                                  blurRadius: 7.0,
                                  spreadRadius: 0.0,
                                )
                              ],
                              color: Colors.red,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.white,width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red,
                                  offset: Offset(2, 4),
                                  blurRadius: 7.0,
                                  spreadRadius: 0.0,
                                )
                              ],
                              color: Colors.red,
                            ),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                          errorWidget: (context, url, error) => Container(
                            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              border: Border.all(color: Colors.white,width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red,
                                  offset: Offset(2, 4),
                                  blurRadius: 7.0,
                                  spreadRadius: 0.0,
                                )
                              ],
                              color: Colors.red,
                            ),
                            child: Icon(Icons.error),
                            // width: 150,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.red,
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          createPhoneCallDialog(context);
                          setState(() {
                            callClicked = true;
                            mailClicked = false;
                            locationClicked = false;
                            moreClicked = false;
                          });
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.call, size: 30, color: Colors.white,),
                          radius: 25,
                          backgroundColor: callClicked ? Colors.black : Colors.transparent,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          launchURL('mailto:chheanbrosna101@gmail.com');
                          setState(() {
                            callClicked = false;
                            mailClicked = true;
                            locationClicked = false;
                            moreClicked = false;
                          });
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.mail, size: 30, color: Colors.white,),
                          radius: 25,
                          backgroundColor: mailClicked ? Colors.black : Colors.transparent,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            callClicked = false;
                            mailClicked = false;
                            locationClicked = true;
                            moreClicked = false;
                          });
                          launchURL('https://goo.gl/maps/GCNbPccyCuWjUUwz9');
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.location_on, size: 30, color: Colors.white,),
                          radius: 25,
                          backgroundColor: locationClicked ? Colors.black : Colors.transparent,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          launchURL('sms:093 65 15 13');
                          setState(() {
                            callClicked = false;
                            mailClicked = false;
                            locationClicked = false;
                            moreClicked = true;
                          });
                        },
                        child: CircleAvatar(
                          child: Icon(Icons.more_horiz, size: 30, color: Colors.white,),
                          radius: 25,
                          backgroundColor: moreClicked ? Colors.black : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    launchURL('https://goo.gl/maps/GCNbPccyCuWjUUwz9');
                  },
                  child: CachedNetworkImage(
                    imageUrl: 'https://c1.10times.com/map/venue/67298.png',
                    imageBuilder: (context, imageProvider) => Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.white,width: 1),
                        color: Colors.red,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.white,width: 1),
                        color: Colors.red,
                      ),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.white,width: 1),
                        color: Colors.red,
                      ),
                      child: Icon(Icons.error),
                      // width: 150,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.red,
                    onPressed: (){
                      launchURL('mailto:chheanbrosna3401@gmail.com');
                    },
                    child: Text('ផ្ញើសារ', style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'KhmerOSbattambang',
                    ),),
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      )
    );
  }

  Future<void> createPhoneCallDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Do you want to call?', style: TextStyle(
            color: Colors.black,
          ),),
          content: Text('093 65 15 13', style: TextStyle(
            color: Colors.black
          ),),
          actions: [
            FlatButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(
                color: Colors.red
              ),),
            ),
            FlatButton(
              onPressed: (){
                launchURL('tel:093 65 15 13');
              },
              child: Text('Call', style: TextStyle(
                color: Colors.red,
              ),),
            ),
          ],
        );
      }
    );
  }
}
