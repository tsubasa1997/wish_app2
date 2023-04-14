import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/not_find_user_exception.dart';
import '../models/item.dart';
import '../models/user.dart';

final firestoreDatasourceProvider = Provider(
      (_) => FirestoreDatasource(),
);

class FirestoreDatasource {
  final _db = FirebaseFirestore.instance;
  static const usersCollectionId = 'users';
  static const itemsCollectionId = 'items';

  String createItemId(String userId) => _db
      .collection(usersCollectionId)
      .doc(userId)
      .collection(itemsCollectionId)
      .doc()
      .id;

  Future<void> createItem(String userId, Item item) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(userId)
        .collection(itemsCollectionId)
        .doc(item.id);
    await ref.set(item.toJson());
  }

  Future<void> deleteItem(String uid, String itemId) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(itemsCollectionId)
        .doc(itemId);
    await ref.delete();
  }

  Future<void> updateItem(String uid, Item item) async {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(itemsCollectionId)
        .doc(item.id);
    await ref.update(item.toJson());
  }

  Stream<List<Item>> listenItems(String uid) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(itemsCollectionId);
    yield* ref.snapshots().map((event) {
      return event.docs.map((e) {
        final json = e.data();
        return Item.fromJson(json);
      }).toList();
    });
  }


  Future<User> fetchUserInfo(String userId) async {
    final ref = _db.collection(usersCollectionId).doc(userId);
    final doc = await ref.get();
    final json = doc.data();
    if (json == null) {
      throw NotFindReferenceException(ref: ref);
    }
    return User.fromJson(json);
  }

  Stream<User> listenUserInfo(String userId) async* {
    final ref = _db.collection(usersCollectionId).doc(userId);
    final snap = ref.snapshots();
    yield* snap.map((event) {
      final json = event.data();
      if (json == null) {
        throw NotFindReferenceException(ref: ref);
      }
      return User.fromJson(json);
    });
  }

  Stream<Item> listenItem(String uid,String itemId) async* {
    final ref = _db
        .collection(usersCollectionId)
        .doc(uid)
        .collection(itemsCollectionId)
        .doc(itemId);
    final snap = ref.snapshots();
    yield* snap.map((event) {
      final json = event.data();
      if(json == null){
        throw NotFindReferenceException(ref: ref);
      }
      return Item.fromJson(json);
    });
  }
}