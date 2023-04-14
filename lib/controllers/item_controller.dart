
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/item.dart';
import '../repositorys/item_repository.dart';

part 'item_controller.freezed.dart';

final itemStateProvider = StateNotifierProvider<ItemStateNotifier, ItemState>(
  (read) => ItemStateNotifier(ref: read),
);

@freezed
class ItemState with _$ItemState {
  const factory ItemState({
    String? sharedText,
    @Default(<int>[]) List<int> totalPrice,
    @Default(<Item>[]) List<Item> selectedItems,
  }) = _ItemState;
}

class ItemStateNotifier extends StateNotifier<ItemState> {
  ItemStateNotifier({required this.ref}) : super(const ItemState());
  final Ref ref;

  ItemRepository get _repository => ref.read(itemRepositoryProvider);



  Future<void> createItem({
    required String name,
    required String price,
    required String itemUrl,
    required String? imageUrl,
    required userId,
  }) async {
    // final imageUrl = state.imageUrl;
    final createPrice = int.tryParse(price) ?? 0;

    await _repository.createItem(
      name: name,
      price: createPrice,
      itemUrl: itemUrl,
      userId: userId,
      imageUrl: imageUrl,
    );
  }

  Future<void> deleteItem({
    required String uid,
    required String itemId,
  }) async {
    await _repository.deleteItem(uid: uid, itemId: itemId);
  }

  Future<void> updateItem({
    required String uid,
    required String itemId,
    required String itemName,
    required String itemPrice,
    required String imageUrl,
    required String itemUrl,
  }) async {
    final price = int.tryParse(itemPrice) ?? 0;

    await _repository.updateItem(
      uid: uid,
      itemId: itemId,
      itemName: itemName,
      itemPrice: price,
      imageUrl: imageUrl,
      itemUrl: itemUrl,
    );
  }

  Future<void> selectedItem({required Item item}) async {
    final selectedItems = [...state.selectedItems];
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
      state = state.copyWith(selectedItems: selectedItems);
    } else {
      selectedItems.add(item);
      state = state.copyWith(selectedItems: selectedItems);
    }
  }
}
