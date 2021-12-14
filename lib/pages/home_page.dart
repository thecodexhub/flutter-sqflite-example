import 'package:flutter/material.dart';
import 'package:flutter_sqflite_example/common_widgets/dog_builder.dart';
import 'package:flutter_sqflite_example/common_widgets/breed_builder.dart';
import 'package:flutter_sqflite_example/models/breed.dart';
import 'package:flutter_sqflite_example/models/dog.dart';
import 'package:flutter_sqflite_example/pages/breed_form_page.dart';
import 'package:flutter_sqflite_example/pages/dog_form_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Dog>> _getDogs() async {
    // Remove this line -->
    await Future.delayed(Duration(seconds: 2));
    // Add code here
    return [];
  }

  Future<List<Breed>> _getBreeds() async {
    // Remove this line -->
    await Future.delayed(Duration(seconds: 2));
    // Add code here
    return [];
  }

  Future<void> _onDogDelete(Dog dog) {
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dog Database'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Dogs'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Breeds'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DogBuilder(
              future: _getDogs(),
              onDelete: _onDogDelete,
            ),
            BreedBuilder(
              future: _getBreeds(),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BreedFormPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              heroTag: 'addBreed',
              child: FaIcon(FontAwesomeIcons.plus),
            ),
            SizedBox(height: 12.0),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DogFormPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
              heroTag: 'addDog',
              child: FaIcon(FontAwesomeIcons.paw),
            ),
          ],
        ),
      ),
    );
  }
}
