import 'package:flutter/material.dart';

import '../pages/my_body.dart';
import '../pages/my_drawer.dart';
import '../pages/my_navigation_bar.dart';

class Home extends StatelessWidget {
  static const String routeHome = '/home';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mme Rachid"),
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: MyNavitionBar(),
      drawer: MyDrawer(),
      body: MyBody(),
    );
  }
}
