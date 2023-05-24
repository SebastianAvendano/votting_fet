// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/user_provider.dart';
import 'package:votting/core/repositories/user_repository/user_impl.dart';
import 'package:votting/data/models/user/user_model.dart';

@singleton
class MainController {
  final FirebaseAuth _auth;
  final UserInterfaceImpl _userImpl;

  MainController(this._userImpl, this._auth);

  void init(BuildContext context) {
    getUser(context);
  }

  StreamSubscription<DocumentSnapshot>? streamUser;

  void getUser(BuildContext context) {
    _userImpl.getUserStream(_auth.currentUser!.uid).then((stream) {
      if (stream != null) {
        streamUser = stream.listen(
          (snapshot) async {
            final UserModel user = snapshot.data()!;
            final DocumentSnapshot docRol = await user.rol!.get();
            final String rolName = docRol.get('name') ?? '';
            setUser(
              context: context,
              user: user.copyWith(
                rolName: rolName,
                reference: snapshot.reference,
              ),
            );
          },
        );
      }
    });
  }

  void setUser({required BuildContext context, required UserModel user}) {
    context.read<UserProvider>().user = user;
  }

  void dispose() {
    streamUser?.cancel();
  }
}
