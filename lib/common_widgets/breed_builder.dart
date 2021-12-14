import 'package:flutter/material.dart';
import 'package:flutter_sqflite_example/models/breed.dart';

class BreedBuilder extends StatelessWidget {
  const BreedBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Breed>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Breed>>(
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
              final breed = snapshot.data![index];
              return _buildBreedCard(breed, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildBreedCard(Breed breed, BuildContext context) {
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
                color: Colors.grey[300],
              ),
              alignment: Alignment.center,
              child: Text(
                breed.id.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    breed.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(breed.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
