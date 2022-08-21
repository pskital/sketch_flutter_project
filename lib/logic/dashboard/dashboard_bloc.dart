import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Cubit<int> {
  DashboardBloc() : super(0);
  final GlobalKey<NavigatorState> homeRoute = GlobalKey<NavigatorState>();
  final PageController pageController = PageController();

  int currentPageIndex = 0;

  void setCurrentPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
    currentPageIndex = index;
    emit(index);
  }
}
