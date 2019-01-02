import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);
}
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//  final String title;
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  List<Text> _items = [
    Text('Index 0: Home',style: TextStyle(fontSize: 33,color: Colors.redAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
    Text('Index 1: Business'),
    Text('Index 2: School'),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
      //Toast
      Fluttertoast.showToast(msg: 'tapped ${_counter}',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white);
      //SnackBar context有问题
      // https://stackoverflow.com/questions/51304568/scaffold-of-called-with-a-context-that-does-not-contain-a-scaffold/51304732
//      Scaffold.of(context).showSnackBar(SnackBar(content: new Text('tapped ${_counter}')));
      print('FloatButton was tapped ' + _counter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _items.elementAt(_currentIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text("Business")),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text("School")),
        ],
        onTap: _onItemOnTap,
        currentIndex: _currentIndex,
        fixedColor: Colors.blueAccent,
        iconSize: 28,
      ),
    );
  }

  void _onItemOnTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
