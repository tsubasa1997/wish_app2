import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../repositorys/item_repository.dart';

final userItemsProvider = StreamProvider.autoDispose.family<User, String>(
      (ref, uid) => ref.watch(itemRepositoryProvider).listenItems(uid),
);