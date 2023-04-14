import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish_list_app_mk2/ui/widgets/text_field_input.dart';

import '../../controllers/item_controller.dart';
import '../../models/item.dart';
import '../../providers/item_info_provider.dart';
import '../home_screen.dart';
import 'content_image.dart';

class EditItemScreen extends ConsumerStatefulWidget {
  const EditItemScreen({super.key, required this.uid, required this.item});

  final String uid;
  final Item item;

  @override
  ConsumerState<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends ConsumerState<EditItemScreen> {

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    final TextEditingController itemNameController = TextEditingController(text: widget.item.name);
    final TextEditingController itemPriceController = TextEditingController(text: widget.item.price.toString());
    final TextEditingController imageUrlController = TextEditingController(text:  widget.item.imageUrl);

    final userItem = ref.watch(
      itemInfoProvider(
        ItemInfoState(
          uid: widget.uid,
          itemId: widget.item.id,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集ページ'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: userItem.when(
        data: (item) {
          final imageUrl = item.imageUrl;
          return SafeArea(
            child: Center(
              child: Column(
                children: [
                  if (imageUrl != null && imageUrl.isNotEmpty)
                    Expanded(
                      child: Center(
                        child: ContentImage(item.imageUrl),
                      ),
                    ),
                  if (imageUrl == '')
                    const Expanded(
                      child: Center(
                        child: ContentImage('https://www.gtn-co.com/cms/wp-content/uploads/2020/06/noimage.jpg'),
                      ),
                    ),
                  const Text('Image-URL'),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFieldInput(
                      textEditingController: imageUrlController,
                      hintText: widget.item.imageUrl ?? 'URL:',
                      textInputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  const Text('Name'),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFieldInput(
                      textEditingController: itemNameController,
                      hintText: widget.item.name,
                      textInputType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  const Text('Price'),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFieldInput(
                      textEditingController: itemPriceController,
                      hintText: '${widget.item.price.toString()}円',
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.04,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(itemStateProvider.notifier).updateItem(
                            uid: widget.uid,
                            itemId: item.id,
                            itemName: itemNameController.text,
                            itemPrice: itemPriceController.text,
                            imageUrl: imageUrlController.text,
                            itemUrl: item.itemUrl,
                          );
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: const Text(
                      '更新',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (e, _) => const Text('error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
