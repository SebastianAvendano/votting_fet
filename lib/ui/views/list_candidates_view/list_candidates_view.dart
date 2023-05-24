import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/election_provider.dart';
import 'package:votting/data/models/candidate/candidate_model.dart';
import 'package:votting/data/models/election/election_model.dart';
import 'package:votting/ui/widgets/app_bar.dart';
import 'package:votting/ui/widgets/card.dart';

class ListCandidates extends StatelessWidget {
  const ListCandidates({super.key});

  @override
  Widget build(BuildContext context) {
    final ElectionModel election = context.read<ElectionProvider>().election;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Candidatos"),
        centerTitle: true,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 15.0),
        itemCount: election.candidates?.length ?? 0,
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final List<CandidateModel> candidates = election.candidates!;

          return _buildListCandidates(context, candidates[index]);
        },
      ),
    );
  }

  Widget _buildListCandidates(BuildContext context, CandidateModel candidate) {
    // final controller = injector.get<ListElectionsController>();
    return CardWidget(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Image.network(
            candidate.image!,
            height: 250,
            fit: BoxFit.fitHeight,
          ),
          ListTile(
            title: Text(
              candidate.name!.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
    );
  }
}
