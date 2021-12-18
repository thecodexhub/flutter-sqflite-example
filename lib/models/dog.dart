import 'dart:convert';

import 'package:flutter/widgets.dart';

class Dog {
  final int? id;
  final String name;
  final int age;
  final Color color;
  final int breedId;

  Dog({
    this.id,
    required this.name,
    required this.age,
    required this.color,
    required this.breedId,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'color': color.value,
      'breedId': breedId,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
      color: Color(map['color']),
      breedId: map['breedId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) => Dog.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog(id: $id, name: $name, age: $age, color: $color, breedId: $breedId)';
  }
}
