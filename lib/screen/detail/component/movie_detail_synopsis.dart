import 'package:flutter/material.dart';

class MovieDetailSynopsis extends StatelessWidget {
  const MovieDetailSynopsis({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        '$text',
        style: Theme.of(context)
            .textTheme
            .labelLarge
            ?.copyWith(color: Colors.grey),
      ),
    );
  }
}
