import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish_list_app_mk2/ui/widgets/text_field_input.dart';

import '../../controllers/item_controller.dart';

class AddItem extends ConsumerStatefulWidget {
  const AddItem({
    Key? key,
    required this.uid,
    required this.url,
  }) : super(key: key);

  final String uid;
  final String? url;

  @override
  ConsumerState<AddItem> createState() => _AddItemState();
}

class _AddItemState extends ConsumerState<AddItem> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _itemPriceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController(text: null);


  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('リストに追加'),
        leading: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(itemStateProvider.notifier).createItem(
                    name: _itemNameController.text,
                    price: _itemPriceController.text,
                    itemUrl: widget.url ?? _urlController.text,
                    userId: widget.uid,
                    imageUrl: _imageUrlController.text,
                  );

              Navigator.of(context).pop();
            },
            child: const Text(
              '追加する',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const Text('URL'),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldInput(
                    textEditingController: _urlController,
                    hintText: widget.url ?? 'URL:',
                    textInputType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const Text('Name'),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldInput(
                    textEditingController: _itemNameController,
                    hintText: 'Item Name:',
                    textInputType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const Text('Price'),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldInput(
                    textEditingController: _itemPriceController,
                    hintText: 'Price:',
                    textInputType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                const Text('画像のUrl'),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFieldInput(
                    textEditingController: _imageUrlController,
                    hintText: 'ImageUrl:',
                    textInputType: TextInputType.text,
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
