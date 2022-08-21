import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/logic/dashboard/dashboard_bloc.dart';
import 'package:sketch_flutter_project/ui/scenes/home_scene/home_nested_page.dart';
import 'package:sketch_flutter_project/ui/scenes/home_scene/home_page.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class HomeRootWidget extends BlocWidget<DashboardBloc, int> {
  @override
  Widget buildWidget(BuildContext context, DashboardBloc bloc) {
    return WillPopScope(
      onWillPop: () async => _systemBackButtonPressed(bloc),
      child: Navigator(
        key: bloc.homeRoute,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<Route<dynamic>>(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/homeNested':
                  return HomeNestedPage();
                default:
                  return HomePage();
              }
            },
          );
        },
      ),
    );
  }

  Future<bool> _systemBackButtonPressed(DashboardBloc bloc) {
    final NavigatorState? currentState = bloc.homeRoute.currentState;
    final int index = bloc.currentPageIndex;
    if (index == 0 && currentState != null && currentState.canPop()) {
      currentState.pop();
      return Future<bool>.value(false);
    } else {
      return Future<bool>.value(true);
    }
  }
}
