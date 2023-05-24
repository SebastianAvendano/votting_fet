import 'package:flutter/material.dart';
import 'package:votting/data/models/bottom_bar_model.dart';
import 'package:votting/ui/views/list_elections_view/list_elections_view.dart';
import 'package:votting/ui/views/profile_view/profile_view.dart';

class MainStore {
  static List<BottomBarModel> pages = const [
    BottomBarModel(
      icon: Icons.home_outlined,
      label: 'Votaciones',
      title: 'Votaciones',
      widget: ListElectionView(),
    ),
    BottomBarModel(
      icon: Icons.account_box_outlined,
      label: 'Perfil',
      title: 'Perfil',
      widget: ProfileView(),
    ),
  ];
}
