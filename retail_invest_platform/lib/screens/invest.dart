import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retailinvestplatform/utils/cards.dart';

class InvestPage extends StatefulWidget {
  @override
  _InvestPage createState() => _InvestPage();
}

class _InvestPage extends State<InvestPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(20, 25, 74, 1),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60),)
                ),
              ),
              SafeArea(
                child: ListView(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "\nTotal Balance\n", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18)),
                                TextSpan(text: "\$ ", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 30)),
                                TextSpan(text: "1,234.00 \n", style: TextStyle(color: Colors.white, fontSize: 36)),
                                TextSpan(text: " \nYour cards", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 18)),
                              ]
                          )),
                        ),
                        IconButton(icon: Icon(Icons.more_vert, color: Colors.white,size: 40,), onPressed: (){})
                      ],
                    ),

                    SizedBox(height: 5,),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          CreditCard(color: "2a1214", number: 9290, image: "master.png", valid: "VALID 10/22",),
                          CreditCard(color: "000068", number: 1298, image: "visa.png", valid: "VALID 07/24",),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Send money"),
                        ),
                      ],
                    ),

                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(child: Icon(Icons.add), radius: 25,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(backgroundImage: AssetImage("assets/p2.jpg"),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(backgroundImage: AssetImage("assets/p3.jpg"),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(backgroundImage: AssetImage("assets/p1.jpg"),),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Recent transactions"),
                        ),
                      ],
                    ),

                    ListTile(
                      onTap: (){
                        _settingModalBottomSheet(context);
                      },
                      leading: CircleAvatar(backgroundImage: AssetImage("assets/p3.jpg"),),
                      title: RichText(text: TextSpan(children: [
                        TextSpan(text: 'Marley Geremy\n'),
                        TextSpan(text: 'Money Sent - Today 9AM', style: TextStyle(fontSize: 14, color: Colors.grey))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                      trailing: Text("- \$430", style: TextStyle(fontSize: 20),),
                    ),

                    ListTile(
                      onTap: (){
                        _settingModalBottomSheet(context);
                      },
                      leading: CircleAvatar(backgroundImage: AssetImage("assets/p2.jpg"),),
                      title: RichText(text: TextSpan(children: [
                        TextSpan(text: 'Jason Martin\n'),
                        TextSpan(text: 'Money received - Today 12PM', style: TextStyle(fontSize: 14, color: Colors.grey))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                      trailing: Text("+ \$220", style: TextStyle(fontSize: 20),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,

                    Colors.white.withOpacity(0.1),

                  ])
          ),
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Dashbord", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cards", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.grey),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("History", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.grey),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Settings", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.grey),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Profile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.grey),),
              ),


            ],
          ),
        )
    );
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
            ),
            child: new Wrap(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center
                  ,children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(radius: 25,backgroundImage: AssetImage("assets/p2.jpg"),),
                  ),
                ],),
                Container(
                  alignment: Alignment.center,
                  child: Text("Jason Martin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("Amount to send"),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                          onTap: (){
//                            if(money != 0){
//                              money -= 10;
//                            }
                          },
                          child: CircleAvatar(child: Icon(Icons.remove, color: Colors.white,), radius: 20, backgroundColor: Colors.grey,)),
                    ),
                    SizedBox(width: 10,),
                    Text("", style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold ),),
                    SizedBox(width: 10,),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              //money += 10;
                            });
                          },
                          child: CircleAvatar(child: Icon(Icons.add, color: Colors.white,), radius: 20, backgroundColor: Colors.grey,)),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(20, 25, 74, 1),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text("Send Money", style: TextStyle(fontSize: 22, color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}