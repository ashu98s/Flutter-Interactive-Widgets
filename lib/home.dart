import 'package:flutter/material.dart';

import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';
import 'screens/grocery_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
   // Replace with Explore Screen
    ExploreScreen(),
    // Replace with Recipe Screen
    RecipesScreen(),
    // TODO 1: Replace with grocery screen
    const GroceryScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO 9: Wrap inside a Consumer Widget
    // 1
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        // 2
        // TODO: Replace body
        body: IndexedStack(index: tabManager.selectedTab, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context)
              .textSelectionTheme.selectionColor,
          // 3
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            // 4
            tabManager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    },
    );
  }
}
