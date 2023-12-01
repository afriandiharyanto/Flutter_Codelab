import 'package:ait_training/word/word_cubit.dart';
import 'package:ait_training/word/word_favorites_page.dart';
import 'package:ait_training/word/word_generator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePageState extends ChangeNotifier {
  int selectedIndex = 0;

  void selectedPage(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageState(),
      child: const Row(
        children: [Drawer(), Expanded(child: Display())],
      ),
    );
  }
}

class Drawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageState state = context.watch<HomePageState>();

    return SafeArea(
      child: NavigationRail(
        extended: false,
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.favorite),
            label: Text('Favorites'),
          ),
        ],
        selectedIndex: state.selectedIndex,
        onDestinationSelected: (value) {
          state.selectedPage(value);
        },
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageState state = context.watch<HomePageState>();

    StatelessWidget page;
    if (state.selectedIndex == 0) {
      page = const WordGeneratorPage();
    } else if (state.selectedIndex == 1) {
      page = const WordFavoritesPage();
    } else {
      throw UnimplementedError('no widget for ${state.selectedIndex}');
    }

    return Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: BlocProvider(
          create: (_) => WordPairCubit(),
          child: page,
        ));
  }
}
