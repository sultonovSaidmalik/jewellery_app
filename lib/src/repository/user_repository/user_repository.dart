import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:jewellery_app/src/common/models/user_model.dart';

abstract interface class UserRepository {
  abstract FirebaseDatabase storage;

  void registerUser(User user);
  Future<User?> getUser(String userId);
}

class UserRepositoryImpl implements UserRepository {
  @override
  FirebaseDatabase storage;

  UserRepositoryImpl._() : storage = FirebaseDatabase.instance;
  static final _instance = UserRepositoryImpl._();

  factory UserRepositoryImpl() => _instance;

  late final db = storage.ref('app');

  @override
  Future<void> registerUser(User user) async {
    final folder = db.child(Folder.users.name);
    await folder.child(user.userId!).set(user.toJson());
  }

  @override
  Future<User?> getUser(String userId) async {
    final folder = db.child(Folder.users.name);
    final snapshot = await folder.child(userId).get();

    final user = User.fromJson(jsonDecode(jsonEncode(snapshot.value)));
    print(user);
    return user;
  }

}

enum Folder {
  users,
  orders,
  products,
}
