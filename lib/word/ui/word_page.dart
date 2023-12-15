import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:ait_training/word/ui/word_favorites_page.dart';
import 'package:ait_training/word/ui/word_generator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WordPage extends StatefulWidget {
  const WordPage({super.key});

  @override
  State<WordPage> createState() => _HomePageState();
}

class _HomePageState extends State<WordPage> {
  final List<Widget> _page = <Widget>[
    const WordGeneratorPage(),
    const WordFavoritesPage(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.cyan,
        title: const Text("Boring App"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => GetIt.I<WordCubit>(),
        child: _page[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.generating_tokens),
            label: "Generator",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
