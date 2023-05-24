import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:votting/core/providers/bottom_bar_provider.dart';
import 'package:votting/ui/views/main_view/main_controller.dart';
import 'package:votting/ui/widgets/app_bar.dart';
import 'package:votting/ui/widgets/bottom_bar.dart';

import 'main_store.dart';

final injector = GetIt.instance;
final controller = injector.get<MainController>();

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    controller.init(context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<BottomBarProvider>().currentPage;
    return Scaffold(
      appBar: CustomAppBar(title: Text(MainStore.pages[currentPage].title)),
      body: IndexedStack(
        index: currentPage,
        children: List.generate(
          MainStore.pages.length,
          (index) => MainStore.pages[index].widget,
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        currentPage: currentPage,
        pages: MainStore.pages,
        onChangeTab: (int index) => onChangePage(context, index),
      ),
    );
  }

  void onChangePage(BuildContext context, int index) {
    context.read<BottomBarProvider>().currentPage = index;
  }
}
