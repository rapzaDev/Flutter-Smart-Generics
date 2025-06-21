import 'package:flutter/material.dart';
import 'package:flutter_smart_generics/core/parser.dart';
import 'package:flutter_smart_generics/core/list_builder.dart';

void main() => runApp(const MyApp());

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json['name'], email: json['email']);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mockData = [
      {'name': 'Alice', 'email': 'alice@example.com'},
      {'name': 'Bob', 'email': 'bob@example.com'},
    ];

    final users =
        mockData.map((e) => parseData<User>(e, User.fromJson)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Smart Generics Example')),
        body: buildList<User>(
          items: users,
          builder: (user) => ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          ),
        ),
      ),
    );
  }
}
