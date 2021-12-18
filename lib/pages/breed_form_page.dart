import 'package:flutter/material.dart';
import 'package:flutter_sqflite_example/models/breed.dart';
import 'package:flutter_sqflite_example/services/database_service.dart';

class BreedFormPage extends StatefulWidget {
  const BreedFormPage({Key? key}) : super(key: key);

  @override
  _BreedFormPageState createState() => _BreedFormPageState();
}

class _BreedFormPageState extends State<BreedFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final name = _nameController.text;
    final description = _descController.text;

    await _databaseService
        .insertBreed(Breed(name: name, description: description));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new breed'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of the breed here',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descController,
              maxLines: 7,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter description about the breed here',
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _onSave,
                child: Text(
                  'Save the Breed',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
