import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/strings.dart';
import 'package:sketch_flutter_project/logic/dashboard/dashboard_bloc.dart';
import 'package:sketch_flutter_project/ui/home/home_root_widget.dart';
import 'package:sketch_flutter_project/ui/settings_scene/settings_page.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_builder_widget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (c) => DashboardBloc(),
      child: _DashboardPage(),
    );
  }
}

class _DashboardPage extends BlocBuilderWidget<DashboardBloc, int> {
  @override
  buildWidget(BuildContext context, bloc, data) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: PageView(
        controller: bloc.pageController,
        onPageChanged: bloc.setCurrentPage,
        children: [HomeRootWidget(), SettingsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: data,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: Strings.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: Strings.settings,
          ),
        ],

        onTap: bloc.setCurrentPage,
      ),
    );
  }
}
