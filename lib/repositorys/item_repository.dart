import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../detasources/firestore_datasource.dart';
import '../models/item.dart';
import '../models/user.dart';

final itemRepositoryProvider = Provider(
  (ref) => ItemRepository(ref: ref),
);

class ItemRepository {
  const ItemRepository({required this.ref});

  final Ref ref;

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<void> createItem({
    required String name,
    required int price,
    required String itemUrl,
    required String? imageUrl,
    required String userId,
  }) async {
    final item = Item(
      id: _remote.createItemId(userId),
      name: name,
      price: price,
      itemUrl: itemUrl,
      imageUrl: imageUrl,
    );
    await _remote.createItem(userId, item);
  }

  Future<void> updateItem({
    required String uid,
    required String itemId,
    required String itemName,
    required int itemPrice,
    required String imageUrl,
    required String itemUrl,
  }) async {
    final item = Item(
      id: itemId,
      name: itemName,
      price: itemPrice,
      itemUrl: itemUrl,
      imageUrl: imageUrl,
    );
    await _remote.updateItem(uid, item);
  }

  Future<void> deleteItem({
    required String uid,
    required String itemId,
  }) async {
    await _remote.deleteItem(uid, itemId);
  }

  Stream<User> listenItems(String uid) async* {
    yield* _remote.listenItems(uid).map(
          (event) => User(id: uid, items: event),
        );
  }

  Stream<Item> listenItem({
    required String uid,
    required String itemId,
  }) async* {
    yield* _remote.listenItem(uid, itemId).map((event) => Item(
          id: event.id,
          name: event.name,
          price: event.price,
          itemUrl: event.itemUrl,
          imageUrl: event.imageUrl,
        ),
    );
  }
}
