import 'package:cloud_firestore/cloud_firestore.dart';

class NotFindReferenceException implements Exception {
  const NotFindReferenceException({required this.ref});

  final DocumentReference ref;

  String get message => '!!NotFindReferenceException!!\n'
      'the reference which match ref: $ref is not found\n'
      'you would read wrong reference';

  @override
  String toString() => message;
}