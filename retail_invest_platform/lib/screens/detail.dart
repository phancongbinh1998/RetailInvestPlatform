import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailinvestplatform/screens/invest.dart';

class Detail extends StatefulWidget {
  const Detail({
    Key key,
    @required this.image,
  }) : super(key: key);
  final String image;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Detail'),
//        centerTitle: true,
//        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
//      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/${widget.image}"),
                fit: BoxFit.fill,
              )),
              child: Align(
                alignment: const Alignment(-0.85, 0.65),
                child: SizedBox(
                  width: 60.0,
                  height: 0,
                  child: OverflowBox(
                    minWidth: 0.0,
                    maxWidth: 70.0,
                    minHeight: 0.0,
                    maxHeight: 70.0,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/apple-touch-icon-114x114.png"),
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Text(
                'Army Stew',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25.0,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'USD 123.45 raised',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '14 days left',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        '423 investors',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.03,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.03,
//              color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                alignment: const Alignment(-1.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.03,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  width: MediaQuery.of(context).size.width*0.5,
                  child: ListTile(
                    leading: Container(
//                    Icons.person_pin,
//                    color: Colors.grey[600],
//                    size: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[600],
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    title: Text(
                      'Name',
                    ),
                    subtitle: Text(
                      '23 subscribers',
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 130.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => InvestPage()));
                    },
                    child: Text(
                      'Invest',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 13.0,
                        letterSpacing: 2.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    color: const Color.fromRGBO(20, 25, 74, 1),
                  ),
                ),
              ],
            ),
            Container(
              child: ListTile(
                title: Text(
                    'Hightlights',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25.0,
                    color: Colors.grey[800]
                  ),
                ),
                subtitle: Text(
                  'Location in the up-and-coming Sawyer Heights neighborhood, just 5-minutes from Downtown Houston. The surrounding area is undergoing a revival with new restaurants and bars, attracting young professionals. Over 3,500 apartment units are in development within the areaSpacious building with parking and a patio, unusual for this part of town'
                ),
              ),
            ),
            Container(
              child: ListTile(
                title: Text(
                  'Term',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25.0,
                      color: Colors.grey[800]
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(
                      'Offered By',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Seedcom, LLC',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(
                      'Type',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Revenue Sharing Note',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],

              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Text(
                      'Percentage',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Up to 5%',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}
