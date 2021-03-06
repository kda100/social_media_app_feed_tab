import 'package:feed_tab_spotlas/models/tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///horizontal scroll view used to present the tags

class TagsList extends StatelessWidget {
  final List<Tag> tags;
  final double spacing;

  TagsList({
    required this.tags,
    this.spacing = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tags
            .map(
              (tag) => Card(
                margin: EdgeInsets.only(right: spacing, top: 2, bottom: 2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tag.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
