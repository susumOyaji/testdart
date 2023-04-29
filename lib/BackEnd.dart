import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const BackEnd());
}

class BackEnd extends StatelessWidget {
  const BackEnd({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UsersPage(title: 'Flutter Demo Home Page'),
    );
  }
}


class User {
  final int id;
  final String name;

  User({this.id=1, this.name='non'});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}



class UsersPage extends StatefulWidget {
 const UsersPage({super.key, required this.title});

 final String title;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final response =
        await http.get(Uri.parse('http://localhost:3000/api/users'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        _users =
            responseData.map((dynamic data) => User.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = _users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text('ID: ${user.id}'),
          );
        },
      ),
    );
  }
}
