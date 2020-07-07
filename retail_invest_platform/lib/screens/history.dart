
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPage createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage>{
  List<String> img = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            for (String image in img)
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                alignment: Alignment.topCenter,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(image: image)));
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/" + image),
                                  fit: BoxFit.cover,
                                )),
//                            child: Align(
//                              alignment: const Alignment(-0.8, 1.0),
//                              child: SizedBox(
//                                width: 60.0,
//                                height: 0,
//                                child: OverflowBox(
//                                  minWidth: 0.0,
//                                  maxWidth: 60.0,
//                                  minHeight: 0.0,
//                                  maxHeight: 60.0,
//                                ),
//                              ),
//                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 100.0,
                          height: 30.0,
                          child: Text(
                            "Total Invest",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Montserrat',
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],

                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 100.0,
                            alignment: const Alignment(1.0, -1.0),
                            child: Text(
                              "Army Stew",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 30.0,
                            alignment: const Alignment(1.0, -1.0),
                            child: Text(
                              "USD 123.45",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900],
                              ),
                            ),
                          ),
                        ],
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