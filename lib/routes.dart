import 'package:ait_training/animated/animated_page.dart';
import 'package:ait_training/idea/cubit/idea_cubit.dart';
import 'package:ait_training/idea/ui/idea_page.dart';
import 'package:ait_training/meme/ui/meme_page.dart';
import 'package:ait_training/quotes/cubit/quotes_cubit.dart';
import 'package:ait_training/quotes/ui/quotes_page.dart';
import 'package:ait_training/home/tiled_home.dart';
import 'package:ait_training/word/cubit/word_cubit.dart';
import 'package:ait_training/word/ui/word_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const StaggeredHome();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'word',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => GetIt.I<WordCubit>(),
              child: const WordPage(),
            );
          },
        ),
        GoRoute(
          path: 'quotes',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => GetIt.I<QuotesCubit>(),
              child: const QuotesPage(),
            );
          },
        ),
        GoRoute(
          path: 'meme',
          builder: (BuildContext context, GoRouterState state) {
            return const MemePage();
          },
        ),
        GoRoute(
          path: 'idea',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => GetIt.I<IdeaCubit>(),
              child: const IdeaPage(),
            );
          },
        ),
        GoRoute(
          path: 'animated',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (_) => GetIt.I<IdeaCubit>(),
              child: Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Colors.cyan,
                  title: const Text("Boring App"),
                  centerTitle: true,
                ),
                body: const AnimatedPage(),
              ),
            );
          },
        ),
      ],
    ),
  ],
);

final List<String> destinations = <String>[
  "/meme",
  "/quotes",
  "/idea",
  "/word",
  "/animated",
];
