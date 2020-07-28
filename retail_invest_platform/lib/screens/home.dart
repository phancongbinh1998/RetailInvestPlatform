import 'package:flutter/material.dart';
import 'package:retailinvestplatform/api/project_api_service.dart';
import 'package:retailinvestplatform/api/user_api_service.dart';
import 'package:retailinvestplatform/models/project_model.dart';
import 'package:retailinvestplatform/screens/history.dart';
import 'package:retailinvestplatform/screens/profile.dart';
import 'package:retailinvestplatform/utils/sign_in.dart';

import 'detail.dart';
import 'login.dart';

class Home extends StatefulWidget {
  final String inputString;
  Home({Key key, @required this.inputString}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(inputString);
}

class _HomeState extends State<Home> {
  String inputString;
  _HomeState(this.inputString);
  int _selectedIndex = 0;
  List<String> img = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.png"];
  String username = '';
  String emailUser = '';
  String image =
      'http://image10.bizrate-images.com/resize?sq=60&uid=2216744464';

  Future<void> _onItemTapped(int index) async {

    setState(() {
      _selectedIndex = index;
    });
  }

  List<ProjectModel> listProject;
  Future<void> getAllProject()async{
    final myService = ProjectApiService.create();
    final response = await myService.getAllProject();
    var post = response.body;
    listProject = post;

    if(inputString != null){
      final myService = UserApiService.create();
      final response = await myService.getResource(inputString.trim().toString());
      var post = response.body;
      username = '${post.fullName}';
      emailUser = '${post.email}';
    }

  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(20, 25, 74, 1),
      ),
      body: FutureBuilder(
        future: getAllProject(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print(snapshot.connectionState);
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            List<Widget> _widgetOptions = <Widget>[
              Card(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: (200 / 300),
                  children: <Widget>[
                    for(var list in listProject)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(id: '${list.id}', investor: inputString,)));
                              },
                              child: Container(
                                width: 200.0,
                                height: 210.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage('http://18.139.198.138/' + '${list.imageUrl}'),
                                        fit: BoxFit.cover,
                                    ),
//                                    image: DecorationImage(
//                                      image: AssetImage("assets/1.jpg"),
//                                      fit: BoxFit.cover,
//                                    )
                                ),
                                child: Align(
                                  alignment: const Alignment(-0.8, 1.0),
                                  child: SizedBox(
                                    width: 60.0,
                                    height: 0,
                                    child: OverflowBox(
                                      minWidth: 0.0,
                                      maxWidth: 60.0,
                                      minHeight: 0.0,
                                      maxHeight: 60.0,
//                              child: Container(
//                                decoration: BoxDecoration(
//                                    image: DecorationImage(
//                                  image: AssetImage(
//                                      "assets/apple-touch-icon-114x114.png"),
//                                  fit: BoxFit.cover,
//                                )),
//                              ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height: 56.0,
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      '${list.name}',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontFamily: 'Montserrat',
                                        color: Colors.grey[600],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
//                                  Container(
//                                    width: 70.0,
//                                    height: 83.0,
//                                    child: Column(
//                                      mainAxisAlignment: MainAxisAlignment.end,
//                                      children: <Widget>[
//                                        Container(
//                                          width: 99.0,
//                                          height: 15.0,
//                                          alignment: const Alignment(-1.0, 0.0),
//                                          child: Container(
//                                            width: 75.0,
//                                            height: 5.0,
//                                            color: Colors.red,
//                                            alignment: const Alignment(-1.0, 0.0),
//                                            child: Container(
//                                              width: 30.0,
//                                              height: 5.0,
//                                              color: Colors.blue,
//                                            ),
//                                          ),
//                                        ),
//                                        Container(
//                                          width: 99.0,
//                                          height: 41.0,
//                                          alignment: const Alignment(0.8, -1.0),
//                                          child: Text(
//                                            "USD 123.45",
//                                            style: TextStyle(
//                                              fontFamily: 'Montserrat',
//                                              fontSize: 10.0,
//                                              fontWeight: FontWeight.bold,
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  title: Text('Search'),
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              imageUrl == ''
                                  ? image
                                  : imageUrl != '' ? imageUrl : imageUrl,
                            ),
                            radius: 30,
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(
                            name == '' ? username : name != '' ? name : name,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                            ),
                          ),
                          subtitle: Text(
                            email == '' ? emailUser : email != '' ? email : email,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => ProfilePage(inputUsername: inputString)));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.01,
                        color: const Color.fromRGBO(239, 239, 239, 1),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.question_answer,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Support',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.history,
                            color: Colors.black,
                          ),
                          title: Text(
                            'History',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => HistoryPage()));
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
//                child: ListTile(
//                  leading: Icon(
//                    Icons.account_box,
//                    color: Colors.black,
//                  ),
//                  title: Text(
//                    'Account Settings',
//                    style: TextStyle(
//                      fontFamily: 'Montserrat',
//                    ),
//                  ),
//                  trailing: Icon(
//                    Icons.keyboard_arrow_right,
//                    color: Colors.black,
//                  ),
//                  onTap: () {},
//                ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.supervisor_account,
                            color: Colors.black,
                          ),
                          title: Text(
                            'About Us',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: const Color.fromRGBO(239, 239, 239, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ];
            return Center(
              child: _widgetOptions.elementAt(_selectedIndex),

            );
          }
        }

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Information'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(20, 25, 74, 1),
        onTap: _onItemTapped,
      ),
    );
  }

}
