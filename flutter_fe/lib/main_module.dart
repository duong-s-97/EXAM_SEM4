import 'package:flutter/material.dart';
import 'package:flutter_fe/detail_module.dart';
import 'package:flutter_fe/home_module.dart';
import 'package:flutter_fe/search_module.dart';
import 'package:flutter_fe/tool_module.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainModule extends StatefulWidget {
  const MainModule({super.key});

  @override
  State<MainModule> createState() => _MainModuleState();
}

class _MainModuleState extends State<MainModule> {
  int _curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Column(
              children: [
                Text(
                  "Hi Guy!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Where are you going next?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            backgroundColor: Colors.blue.withOpacity(0.6),
          ),
          body: IndexedStack(
            index: _curentIndex,
            children: const [
              HomeModule(),
              SearchModule(),
              ToolModule(),
              DetailModule(),
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: _curentIndex,
            onTap: (index) {
              setState(
                () {
                  _curentIndex = index;
                },
              );
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: const Text("Search"),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.work),
                title: const Text("History"),
              ),
              SalomonBottomBarItem(
                  icon: const Icon(Icons.account_box),
                  title: const Text("Profile")),
            ],
          ),
        ),
      ),
    );
  }
}
