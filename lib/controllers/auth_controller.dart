import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositorys/auth_repository.dart';

final authProvider = Provider(
  (ref) => AuthController(ref: ref),
);

class AuthController {
  const AuthController({required this.ref});

  final Ref ref;

  AuthRepository get _repository => ref.read(authRepositoryProvider);

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await _repository.createUser(
      email: email,
      password: password,
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await _repository.signIn(email: email, password: password);
  }

  Future<void> signOut() async {
    await _repository.signOut();
  }
}
