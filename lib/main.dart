import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future _data;
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
    _data = fetch();
  }

  Future fetch() async {
    //final String json;
    //List<dynamic> jsonArray = [];

    setState(() {
      _isLoading = true;
      _message = 'Loading data...';
    });

    const url = 'http://localhost:3000'; //←ここに表示させたいURLを入力する

    try {
      final response = await http.get(Uri.parse(url).replace(queryParameters: {
        'data': jsonEncode(data),
      }));
      print("ref");

      setState(() {
        _isLoading = true;
        _message = 'Loading data...';
      });
      return json.decode(response.body);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _message = 'Failed to load data.';
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
          future: _data, //fetch(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetch,
        tooltip: 'fetch',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
