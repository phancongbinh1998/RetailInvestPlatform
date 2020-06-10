import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/1.jpg"),
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
              'Trigonic',
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
                width: MediaQuery.of(context).size.width*0.5,
                child: Text(
                  'USD 123.45 raised',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
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

          )
        ],
      ),
    );
  }
}
