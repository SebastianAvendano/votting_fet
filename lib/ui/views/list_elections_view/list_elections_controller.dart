// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/election_provider.dart';
import 'package:votting/core/repositories/votting_repository/votting_impl.dart';
import 'package:votting/core/utils/hooks/use_navigation.dart';
import 'package:votting/data/enums/snack_bar_type_enum.dart';
import 'package:votting/data/models/election/election_model.dart';
import 'package:votting/ui/widgets/snack_bar_alert_widget.dart';

@singleton
class ListElectionsController {
  final VottingInterfaceImpl _vottingImpl;

  ListElectionsController(this._vottingImpl);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isSelected = ValueNotifier<bool>(false);

  Stream<QuerySnapshot>? getAllDocuments() => _vottingImpl.getAllDocuments();

  void createElection(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      // final int vote = MaintenanceModel(
      //   createdAt: DateTime.now(),
      //   description: descriptionController.text,
      //   phone: phoneController.text,
      //   permissionToEnter: permissionToEnter.value,
      //   status: keyMaintenancePending,
      //   urgency: urgency.value,
      //   category: selectedCategory,
      //   unity: selectedUnity,
      //   user: user.reference,
      //   photo: urlPhoto,
      //   project: user.project,
      // );

      final bool response = await _vottingImpl.createElection(
        {},
      );

      isLoading.value = false;

      if (response) {
        useNavigatePop(context: context);
        return;
      }
      SnackBarFloating.show(
        context: context,
        snackBarType: SnackBarType.error,
        message: "Ocurrió un error, intenta nuevamente!",
      );
    }
  }

  void onSelectedElection(BuildContext context, ElectionModel election) async {
    isSelected.value = true;
    context.read<ElectionProvider>().election = election;
    useNavigatePushName(context: context, route: '/candidates');
  }
}
