import 'package:flutter/material.dart';
import 'package:twitter_client_example/Home.dart';
import 'package:twitter_client_example/KeyWord.dart';
import 'package:twitter_client_example/Notifications.dart';
import 'package:twitter_client_example/Message.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentIndex = 0;
  List tabItemWidget = [
    Home(),
    KeyWord(),
    Notifications(),
    Message()
  ];

  List icons = [
    Icons.add,
    Icons.person_add,
    Icons.settings,
    Icons.mail
  ];

  List titles = [
    "ホーム",
    "キーワード",
    "通知",
    "メッセージ",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: currentIndex != 1
          ? new AppBar(
        title: new Text(titles[currentIndex]),
        actions:[
          new Container(
            margin:EdgeInsets.only(right:10.0),
            child:Icon(icons[currentIndex],color: Colors.blue,),
          ),
        ],
        leading: Container(
          margin: EdgeInsets.all(10.0),
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:DecorationImage(
                fit:BoxFit.cover,
                image:AssetImage("assets/profile.jpg")
            ),
          ),
        ),
      )
          : AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            labelText: 'キーワード検索',
          ),
        ),
        centerTitle: true,
        actions: [
          new Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Icon(
              icons[currentIndex],
              color: Colors.blue,
            ),
          ),
        ],
        leading: Container(
            margin: EdgeInsets.all(10.0),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/profile.jpg")))),
      ),
      body: new Center(
        child: tabItemWidget[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap:_onTaped,
          type:BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
              icon:new Icon(Icons.home,color:Colors.blue,),
              title:new Text(''),
            ),
            BottomNavigationBarItem(
              icon:new Icon(Icons.search,color:Colors.blue,),
              title:new Text(''),
            ),
            BottomNavigationBarItem(
              icon:new Icon(Icons.notifications,color:Colors.blue,),
              title:new Text(''),
            ),
            BottomNavigationBarItem(
              icon:new Icon(Icons.mail,color:Colors.blue,),
              title:new Text(''),
            ),
          ]
      ),
    );
  }
  _onTaped(int index){
    setState((){
      currentIndex = index;
    });
  }
}