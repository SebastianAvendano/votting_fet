import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/config/constants.dart';
import 'package:votting/core/providers/user_provider.dart';
import 'package:votting/ui/widgets/activity_indicator.dart';

import 'list_elections_controller.dart';
import 'widgets/render_list.dart';

final injector = GetIt.instance;

class ListElectionView extends StatelessWidget {
  const ListElectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = injector.get<ListElectionsController>();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getAllDocuments(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ActivityIndicator();
          }

          final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;

          return RenderListDocuments(listDocuments: docs);
        },
      ),
      floatingActionButton: _buildFloatinButton(context),
    );
  }

  Widget _buildFloatinButton(BuildContext context) {
    return Selector<UserProvider, String>(
      selector: (_, userProvider) => userProvider.user.rolName!,
      builder: (BuildContext _, String rolName, Widget? child) {
        return rolName == keyAdminRol ? child! : const SizedBox();
      },
      child: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
