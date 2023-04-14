import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'content_image.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
    required this.onPressed,
  });

  final Item item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.imageUrl;
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              if (imageUrl != null && imageUrl.isNotEmpty)
                Expanded(
                  child: Center(
                    child: ContentImage(item.imageUrl),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${item.price}円',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
