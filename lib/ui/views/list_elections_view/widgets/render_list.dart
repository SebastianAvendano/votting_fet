import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';
import 'package:votting/data/models/election/election_model.dart';
import 'package:votting/ui/views/list_elections_view/list_elections_controller.dart';
import 'package:votting/ui/widgets/activity_indicator.dart';
import 'package:votting/ui/widgets/card.dart';

final injector = GetIt.instance;

class RenderListDocuments extends StatelessWidget {
  const RenderListDocuments({super.key, required this.listDocuments});

  final List<QueryDocumentSnapshot?> listDocuments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 15.0),
      itemCount: listDocuments.length,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        final ElectionModel election = ElectionModel.fromJson(
          listDocuments[index]!.data()! as Map<String, dynamic>,
        ).copyWith(reference: listDocuments[index]!.reference);

        return _buildListElections(context, election);
      },
    );
  }

  Widget _buildListElections(BuildContext context, ElectionModel election) {
    final controller = injector.get<ListElectionsController>();
    return CardWidget(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListTile(
        leading: Text(controller.isSelected.value ? "1" : "0"),
        contentPadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              election.title!.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            Text(
              Jiffy(election.createdAt).format("dd/MM/yyyy"),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 6),
          ],
        ),
        trailing: ValueListenableBuilder(
          valueListenable: controller.isSelected,
          builder: (BuildContext _, bool isLoading, Widget? child) {
            return isLoading ? const ActivityIndicator() : child!;
          },
          child: IconButton(
            onPressed: () => controller.onSelectedElection(context, election),
            icon: Icon(
              Icons.favorite,
              color: controller.isSelected.value ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
