import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gimme_goals/features/main/home/presentation/pages/home_pager.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pager = [const HomePager(), Container()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(
                Icons.receipt_long_rounded,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: pager[currentIndex],
      ),
    );
  }
}
