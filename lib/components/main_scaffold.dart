import 'package:fitness/components/header.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/workout/workout.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  MainScaffold({Key key, this.title, this.isMain, this.pageIndex, this.child})
      : super(key: key);
  final Widget child;
  final String title;
  final int pageIndex;
  final bool isMain;

  void _onItemTapped(BuildContext context, int index) {
    if (index == null || index == 0) navPush(context, WorkoutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Header(
                title: title.toUpperCase(),
                isMain: isMain,
              ),
              Container(
                height: getWindowHeight(context) - 160,
                child: this.child,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
        ],
        currentIndex: pageIndex == null ? 0 : pageIndex,
        selectedItemColor: primaryColor,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}