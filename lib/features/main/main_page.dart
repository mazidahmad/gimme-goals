import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/features/main/history/presentation/cubit/history_cubit.dart';
import 'package:gimme_goals/features/main/history/presentation/pager/history_pager.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/home_cubit.dart';
import 'package:gimme_goals/features/main/home/presentation/pagers/home_pager.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final HomeCubit _homeCubit;
  late final HistoryCubit _historyCubit;
  final List<Widget> pager = [HomePager(), HistoryPager()];

  int currentIndex = 0;

  @override
  void initState() {
    _homeCubit = getIt<HomeCubit>();
    _historyCubit = getIt<HistoryCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _homeCubit.close();
    _historyCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _homeCubit..getTodayBodyMass(),
        ),
        BlocProvider(
          create: (context) => _historyCubit..fetchHistories(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) => setState(() {
              if (value == 0) {
                _homeCubit.getTodayBodyMass();
              } else {
                _historyCubit.fetchHistories();
              }
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
      ),
    );
  }
}
