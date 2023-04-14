import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../detasources/auth_datasource.dart';
import '../detasources/firestore_datasource.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(ref: ref),
);

class AuthRepository {
  const AuthRepository({required this.ref});

  final Ref ref;

  AuthDatasource get _auth => ref.read(authDatasourceProvider);

  FirestoreDatasource get _remote => ref.read(firestoreDatasourceProvider);

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    _auth.createUser(
      email,
      password,
    );
  }

  Stream<String?> uid() async* {
    yield* _auth.getUid().map((event) => event);
  }

  Future<void> signIn({required String email, required String password}) async {
    await _auth.signIn(email, password);
  }

  Future<void> signOut() => _auth.signOut();

}
