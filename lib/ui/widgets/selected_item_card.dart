import 'package:flutter/material.dart';

import '../../models/item.dart';
import 'content_image.dart';

class SelectedItemCard extends StatefulWidget {
  const SelectedItemCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final Item item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<SelectedItemCard> createState() => _SelectedItemCardState();
}

class _SelectedItemCardState extends State<SelectedItemCard> {
  @override
  Widget build(BuildContext context) {
    final url = widget.item.imageUrl;
    return Card(
      child: InkWell(
        onTap: (){
          widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5,color: widget.isSelected ? Colors.blue :Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                if (url != null && url.isNotEmpty)
                  Expanded(
                    child: Center(
                      child: ContentImage(widget.item.imageUrl),
                    ),
                  ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${widget.item.price}円',
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
      ),
    );
  }
}
