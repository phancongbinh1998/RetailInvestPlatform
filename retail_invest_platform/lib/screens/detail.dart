import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:retailinvestplatform/api/project_api_service.dart';
import 'package:retailinvestplatform/api/term_types_api_service.dart';
import 'package:retailinvestplatform/models/project_model.dart';
import 'package:retailinvestplatform/models/term_type.dart';
import 'package:retailinvestplatform/screens/invest.dart';

class Detail extends StatefulWidget {
  final String id;
  final String investor;
  Detail({
    Key key,
    @required this.id,
    @required this.investor
  }) : super(key: key);

  @override
  _DetailState createState() => _DetailState(id, investor);
}

class _DetailState extends State<Detail> {
  String id;
  String investor;

  _DetailState(this.id, this.investor);

  List<TermType> listTermType;
  var post;

  Future<void> getDetailProject() async {
    print(int.parse(id));
    final myService = ProjectApiService.create();
    final response = await myService.getDetailProject(int.parse(id));
    post = response.body;
    print('name: ${post.name}');
    print('name: ${post.imageUrl}');
    print(investor);
    print(id);

    final myService1 = TermTypesApiService.create();
    final response1 = await myService1.getAllTermTypes();
    var post1 = response1.body;
    listTermType = post1;

//    for(var term in listTermType){
//      if(term.id == '${post.termId}'){
//        print("true");
//
//      }
//    }

//    print("name: " + '${post1[0].name}');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Detail'),
//        centerTitle: true,
//        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
//      ),
      body: FutureBuilder(
          future: getDetailProject(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'http://18.139.198.138/' + '${post.imageUrl}'),
                          fit: BoxFit.cover,
                        ),
                      ),
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
//                    child: Container(
//                      decoration: BoxDecoration(
//                          image: DecorationImage(
//                        image: AssetImage("assets/apple-touch-icon-114x114.png"),
//                        fit: BoxFit.cover,
//                      )),
//                    ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Text(
                        '${post.name}',
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
                              'USD ${post.curRaisedAmount} raised',
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
                                '${post.raiseDuration} days left',
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
                          width: MediaQuery.of(context).size.width * 0.5,
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
                              '${post.creator}',
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
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => InvestPage(investor: investor, id: id,)));
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
                              color: Colors.grey[800]),
                        ),
                        subtitle: Html(
                          data: """
                            ${post.hightlights}
                            """,
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Location',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25.0,
                              color: Colors.grey[800]),
                        ),
                        subtitle: Html(
                          data: """
                            ${post.locationAnalysis}
                            """,
                        ),
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'Bussiness Model',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25.0,
                              color: Colors.grey[800]),
                        ),
                        subtitle: Html(
                          data: """
                            ${post.businessModel}
                            """,
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
                              color: Colors.grey[800]),
                        ),
                      ),
                    ),
                    for(var term in listTermType)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Name',
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
                              '${term.name}',
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
                    for(var term in listTermType)
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              'Desc',
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
                              '${term.desc}',
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
              );
            }
          }),
    );
  }
}
