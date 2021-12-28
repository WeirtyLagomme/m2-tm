import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'theme/custom.dart';
import 'pages/home/home.dart';
import 'pages/search/search.dart';
import 'pages/notifications/notifications.dart';
import 'pages/account.dart';
import 'pages/create_model.dart';
import 'pages/create_seance.dart';

void main() {
  runApp(
    const Modelia(
      restorationId: 'bottom_navigation_tab_index',
    ),
  );
}

class Modelia extends StatefulWidget {
  const Modelia({
    Key? key,
    required this.restorationId,
  }) : super(key: key);

  final String restorationId;

  @override
  _ModeliaState createState() => _ModeliaState();
}

class _ModeliaState extends State<Modelia> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  final List<Widget> _pages = [
    const Home(),
    const Search(),
    const Notifications(),
    const Account(),
  ];

  @override
  String get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialBucket) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }

  void _showModalBottomSheet(BuildContext context, Widget page) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return page;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Accueil',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Recherche',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded),
        label: 'Compte',
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: CustomTheme.darkTheme.backgroundColor,
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'assets/logo.png',
              height: kToolbarHeight * 0.8,
            ),
          ),
          backgroundColor: CustomTheme.darkTheme.primaryColorDark,
        ),
        body: Center(
          child: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: _pages[_currentIndex.value],
          ),
        ),
        floatingActionButton: Builder(builder: (appContext) {
          return SpeedDial(
            backgroundColor: CustomTheme.darkTheme.primaryColorLight,
            icon: Icons.add,
            activeIcon: Icons.close,
            spacing: 15,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.fitness_center_rounded),
                  label: 'Nouvelle séance',
                  onTap: () {
                    _showModalBottomSheet(appContext, const CreateSeance());
                  }),
              SpeedDialChild(
                  child: const Icon(Icons.assignment),
                  label: 'Nouveau modèle',
                  onTap: () {
                    _showModalBottomSheet(appContext, const CreateModel());
                  }),
            ],
          );
        }),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: CustomTheme.darkTheme.primaryColorLight,
                width: 1,
              ),
            ),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            items: bottomNavigationBarItems,
            currentIndex: _currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentIndex.value = index;
              });
            },
            selectedItemColor: colorScheme.onPrimary,
            unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
            backgroundColor: CustomTheme.darkTheme.primaryColorDark,
          ),
        ),
      ),
    );
  }
}
