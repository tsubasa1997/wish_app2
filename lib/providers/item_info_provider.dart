import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/item.dart';
import '../repositorys/item_repository.dart';

part 'item_info_provider.freezed.dart';

@freezed
class ItemInfoState with _$ItemInfoState {
  const factory ItemInfoState({
    required String uid,
    required String itemId,
  }) = _ItemInfoState;
}

final itemInfoProvider = StreamProvider.autoDispose.family<Item, ItemInfoState>(
  (ref, itemInfoState) => ref.watch(itemRepositoryProvider).listenItem(
        uid: itemInfoState.uid,
        itemId: itemInfoState.itemId,
      ),
);
