import 'package:flutter/material.dart';

class AgeSlider extends StatelessWidget {
  const AgeSlider({
    Key? key,
    required this.max,
    required this.selectedAge,
    required this.onChanged,
  }) : super(key: key);
  final double max;
  final double selectedAge;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select age',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: Slider(
                min: 0.0,
                max: max,
                divisions: max.toInt(),
                value: selectedAge,
                onChanged: onChanged,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                selectedAge.toInt().toString(),
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: 12.0),
          ],
        ),
      ],
    );
  }
}
