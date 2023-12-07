import 'package:ait_training/idea/ui/idea_page.dart';
import 'package:ait_training/meme/ui/meme_page.dart';
import 'package:ait_training/quotes/ui/quotes_page.dart';
import 'package:ait_training/word/word_cubit.dart';
import 'package:ait_training/word/word_favorites_page.dart';
import 'package:ait_training/word/word_generator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    StatelessWidget page;
    if (_selectedIndex == 0) {
      page = const WordGeneratorPage();
    } else if (_selectedIndex == 1) {
      page = const WordFavoritesPage();
    } else if (_selectedIndex == 2) {
      page = const IdeaPage();
    } else if (_selectedIndex == 3) {
      page = const MemePage();
    } else if (_selectedIndex == 4) {
      page = const QuotesPage();
    } else {
      throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Row(
      children: [
        SafeArea(
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
              NavigationRailDestination(
                icon: Icon(Icons.quora_outlined),
                label: Text('Quora'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.gamepad),
                label: Text('Game'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.donut_large),
                label: Text('Zoom In'),
              ),
            ],
            selectedIndex: _selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
        Expanded(
            child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: BlocProvider(
                  create: (_) => WordPairCubit(),
                  child: page,
                )))
      ],
    );
  }
}
