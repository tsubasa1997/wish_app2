import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../controllers/item_controller.dart';
import '../../controllers/open_url_controller.dart';
import '../../models/item.dart';
import 'edit_item_screen.dart';

class ItemDialog extends ConsumerStatefulWidget {
  const ItemDialog({
    super.key,
    required this.item,
    required this.uid,
  });

  final Item item;
  final String uid;

  @override
  ConsumerState<ItemDialog> createState() => _ItemDialogState();
}

class _ItemDialogState extends ConsumerState<ItemDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Center(
          child: SimpleDialogOption(
            child: const Text(
              'Webページに遷移',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              ref.read(openUrlProvider).openUrl(itemUrl: widget.item.itemUrl);
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: SimpleDialogOption(
            child: const Text(
              'アイテムを削除',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              ref.read(itemStateProvider.notifier).deleteItem(uid: widget.uid, itemId: widget.item.id);
              Navigator.of(context).pop();
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Center(
          child: SimpleDialogOption(
            child: const Text(
              'アイテムを編集',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return EditItemScreen(uid: widget.uid, item: widget.item);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
