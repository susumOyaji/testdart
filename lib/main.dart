import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// myapp.dart
import 'dart:io';
import 'main1.dart';
import 'BackEnd.dart';

void main() {
  runApp(const MyApp());
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
  late Future _data;
  var _response;
  //int MarketCap = 0;
  bool _isLoading = false;
  String _message = '';

  EdgeInsets std_margin =
      const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0);

  static List<List<dynamic>> data = [
    ["6758", 200, 1665],
    ["6976", 300, 1801],
    ["3436", 0, 0],
  ];

  @override
  void initState() {
    super.initState();
    // ここで初期化処理を行う
    //runCommand();
    //_response = fetch();
    _data =fetch();
    //_getUsers();
  }

  var url = 'http://localhost:3000'; //←ここに表示させたいURLを入力する

  Future fetch() async {
    //final String json;
    //List<dynamic> jsonArray = [];

    setState(() {
      _isLoading = true;
      _message = 'Loading data...';
    });

    try {
      //final response =
      //    await http.get(Uri.parse('http://localhost:3000/api/users'));
      //final jsonData = jsonDecode(response.body);
      //return jsonData;
      final response = await http.get(Uri.parse(url).replace(queryParameters: {
        'data': jsonEncode(data),
      }));

      print("ref");

      setState(() {
        _isLoading = true;
        _message = 'Loading data...';
        _response = json.decode(response.body);
        print(_response);
        //_data = json.decode(response.body);
      });

      return json.decode(response.body);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _message = 'Failed to load data.$e';
      });
    }

    //if (response.statusCode == 200) {
    // データを取得できた場合

    //  return json.decode(response.body);
    //} else {
    // エラーが発生した場合
    //throw Exception('Failed to load data');
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
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
                        '$_message$_response',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),

                      //),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
