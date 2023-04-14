import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wish_list_app_mk2/ui/widgets/selected_item_card.dart';

import '../../controllers/item_controller.dart';
import '../../providers/user_items_provider.dart';

class SelectItemScreen extends ConsumerStatefulWidget {
  const SelectItemScreen({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  ConsumerState<SelectItemScreen> createState() => _SelectItemScreenState();
}

class _SelectItemScreenState extends ConsumerState<SelectItemScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ref.watch(userItemsProvider(widget.uid));
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('アイテムを選択'),
      ),
      body: items.when(
        data: (user) {
          final userItem = user.items;
          final state = ref.watch(itemStateProvider);
          int selectPrice = state.selectedItems.isNotEmpty ?state.selectedItems.map((e) => e.price).reduce((value, element) => value + element) : 0;
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: user.items.length,
                    itemBuilder: (context, index) {
                      final item = userItem[index];
                      return SelectedItemCard(
                        item: item,
                        isSelected: state.selectedItems.contains(item),
                        onTap: (){
                          setState(() {
                            ref.read(itemStateProvider.notifier).selectedItem(item: item);
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: deviceHeight *0.2,
                  child: Column(
                    children: [
                      const Text('合計金額'),
                      Text(
                        '$selectPrice円',
                        style: const TextStyle(fontSize: 40, color: Colors.orange),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'ｶﾞﾝﾊﾞｯﾃｵｶﾈﾀﾒﾖｳ!!!!!',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (e, _) => const Text('e'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
