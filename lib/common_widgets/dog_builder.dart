import 'package:flutter/material.dart';
import 'package:flutter_sqflite_example/models/dog.dart';
import 'package:flutter_sqflite_example/services/database_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DogBuilder extends StatelessWidget {
  const DogBuilder({
    Key? key,
    required this.future,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);
  final Future<List<Dog>> future;
  final Function(Dog) onEdit;
  final Function(Dog) onDelete;

  Future<String> getBreedName(int id) async {
    final DatabaseService _databaseService = DatabaseService();
    final breed = await _databaseService.breed(id);
    return breed.name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dog>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final dog = snapshot.data![index];
              return _buildDogCard(dog, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildDogCard(Dog dog, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              alignment: Alignment.center,
              child: FaIcon(FontAwesomeIcons.dog, size: 18.0),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dog.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  FutureBuilder<String>(
                    future: getBreedName(dog.breedId),
                    builder: (context, snapshot) {
                      return Text('Breed: ${snapshot.data}');
                    },
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text('Age: ${dog.age.toString()}, Color: '),
                      Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: dog.color,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.0),
            GestureDetector(
              onTap: () => onEdit(dog),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Icon(Icons.edit, color: Colors.orange[800]),
              ),
            ),
            SizedBox(width: 20.0),
            GestureDetector(
              onTap: () => onDelete(dog),
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                alignment: Alignment.center,
                child: Icon(Icons.delete, color: Colors.red[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
