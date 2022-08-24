import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';
import 'package:sketch_flutter_project/logic/dashboard/dashboard_bloc.dart';
import 'package:sketch_flutter_project/ui/scenes/home_scene/home_root_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/settings_scene/settings_page.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_builder_widget.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      create: (BuildContext c) => DashboardBloc(),
      child: DashboardWidget(),
    );
  }
}

class DashboardWidget extends BlocBuilderWidget<DashboardBloc, int> {
  @override
  Scaffold buildWidget(BuildContext context, DashboardBloc bloc, int data) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: PageView(
        controller: bloc.pageController,
        onPageChanged: bloc.setCurrentPage,
        children: <Widget>[HomeRootWidget(), SettingsPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: data,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: translations.dashboard.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: translations.dashboard.settings,
          ),
        ],
        onTap: bloc.setCurrentPage,
      ),
    );
  }
}
