import 'package:ait_training/idea/cubit/idea_cubit.dart';
import 'package:ait_training/idea/ui/idea_page.dart';
import 'package:ait_training/meme/ui/meme_page.dart';
import 'package:ait_training/quotes/cubit/quotes_cubit.dart';
import 'package:ait_training/quotes/ui/quotes_page.dart';
import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:ait_training/word/ui/word_favorites_page.dart';
import 'package:ait_training/word/ui/word_generator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  StatelessWidget wrapCubit<T>(
      {required Cubit<T> cubit, required StatelessWidget base}) {
    return BlocProvider(
      create: (_) => cubit,
      child: base,
    );
  }

  @override
  Widget build(BuildContext context) {
    StatelessWidget page;
    if (_selectedIndex == 0) {
      page = BlocProvider(
        create: (_) => GetIt.I<WordPairCubit>(),
        child: const WordGeneratorPage(),
      );
    } else if (_selectedIndex == 1) {
      page = BlocProvider(
        create: (_) => GetIt.I<WordPairCubit>(),
        child: const WordFavoritesPage(),
      );
    } else if (_selectedIndex == 2) {
      page = BlocProvider(
        create: (_) => GetIt.I<IdeaCubit>(),
        child: const IdeaPage(),
      );
    } else if (_selectedIndex == 3) {
      page = const MemePage();
    } else if (_selectedIndex == 4) {
      page = BlocProvider(
        create: (context) => GetIt.I<QuotesCubit>(),
        child: const QuotesPage(),
      );
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
                icon: Icon(Icons.lightbulb),
                label: Text('Ideas'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.image),
                label: Text('Meme'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.textsms),
                label: Text('Quotes'),
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
