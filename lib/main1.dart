import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyAppstd());

class MyAppstd extends StatefulWidget {
  const MyAppstd({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppstd> {
  List _users = [];

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  Future<void> _getUsers() async {
    final response = await http.get(Uri.parse('http://localhost:8080'));
    final data = json.decode(response.body) as List;
    setState(() {
      _users = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Users')),
        body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_users[index]['name']),
            );
          },
        ),
      ),
    );
  }
}
