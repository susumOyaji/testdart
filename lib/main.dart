import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// myapp.dart
import 'dart:io';
<<<<<<< HEAD
import 'main1.dart';
=======
import 'BackEnd.dart';
>>>>>>> 08e18759b5b35fceb344fdf6c4fb78db22df4fa8

void main() {
  runApp(const BackEnd());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _word = '';
  String _data = "";
  //var url = 'http://localhost:3000'; //←ここに表示させたいURLを入力する

   List _users = [];



  @override
  void initState() {
    super.initState();
    // ここで初期化処理を行う
    //runCommand();
<<<<<<< HEAD
    _data = fetch();
   //_data =fetch();
  //_getUsers();
  }



  Future fetch() async {
    //final String json;
    //List<dynamic> jsonArray = [];

=======
    //_data = fetch();
    //_data=fetchUsers();
  }

  void _incrementCounter() {
>>>>>>> 08e18759b5b35fceb344fdf6c4fb78db22df4fa8
    setState(() {
      _counter++;
    });
  }

<<<<<<< HEAD
    const url = 'http://localhost:8080'; //←ここに表示させたいURLを入力する

    try {
      final response =
          await http.get(Uri.parse('http://localhost:8080'));
      final jsonData = jsonDecode(response.body);
      //return jsonData;

     // final response = await http.get(Uri.parse(url).replace(queryParameters: {
     //   'data': jsonEncode(data),
     // }));

      print("ref");
=======
  

  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/users'));
>>>>>>> 08e18759b5b35fceb344fdf6c4fb78db22df4fa8


  

    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
      });
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<bool> hasData() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/users'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  Future<void> _handleHttp() async {
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': 'Flutter'});
    //var url =
    //    Uri.http('localhost:8080');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
      setState(() {
        _counter = itemCount;
        _word = 'Flutter';
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
<<<<<<< HEAD
        child: FutureBuilder(
          future: _data,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var res = snapshot.data;
            //final stdstock = res['stdstock'];
            //final anystock = res['anystock'];
            //final totalUnitprice = res['totalUnitprice'];
            //final totalmarketcap = res['totalmarketcap'];
            //final totalGain = res['totalGain'];
            //final totalPolarity = res['totalpolarity'];
            return Stack(
              children: <Widget>[
                Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'You have pushed the button this many Message:',
                      ),
                      Text(
                        '$_message',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      //),
                    ],
                  ),
                ),
              ],
            );
          },
=======
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '「$_word」の検索結果:',
            ),
            Text(
              '$_data',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
>>>>>>> 08e18759b5b35fceb344fdf6c4fb78db22df4fa8
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: hasData,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
