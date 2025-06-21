import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_smart_generics/core/parser.dart';

class User {
  final String name;
  User({required this.name});
  factory User.fromJson(Map<String, dynamic> json) => User(name: json['name']);
}

void main() {
  test('parseData should return correct object', () {
    final json = {'name': 'Test'};
    final user = parseData<User>(json, User.fromJson);
    expect(user.name, 'Test');
  });
}
