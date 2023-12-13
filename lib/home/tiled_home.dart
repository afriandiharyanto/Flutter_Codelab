import 'package:ait_training/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

class StaggeredHome extends StatelessWidget {
  const StaggeredHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF245953),
        toolbarHeight: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: _icons.length,
            (context, index) {
              return Tile(
                _colors[index],
                _icons[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }

  Color random() {
    var index = math.Random().nextInt(_colors.length);
    return _colors[index];
  }

  IconData randomIcon() {
    var index = math.Random().nextInt(_icons.length);
    return _icons[index];
  }

  final List<IconData> _icons = const <IconData>[
    Icons.widgets,
    Icons.wifi,
    Icons.panorama_wide_angle,
    Icons.map,
    Icons.send,
    Icons.airline_seat_flat,
    Icons.bluetooth,
    Icons.battery_alert,
    Icons.desktop_windows,
    Icons.radio,
  ];

  final List<Color> _colors = const <Color>[
    Color(0xff7703d6),
    Color(0xff6a00ff),
    Color(0xffff00ff),
    Color(0xffff0040),
    Color(0xffff9500),
    Color(0xffffff00),
    Color(0xffaaff00),
    Color(0xff00ff15),
    Color(0xff00ffff),
    Color(0xff0095ff),
  ];
}

class Tile extends StatelessWidget {
  const Tile(
    this.backgroundColor,
    this.iconData, {
    required this.index,
    super.key,
  });

  final Color backgroundColor;
  final IconData iconData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: InkWell(
        onTap: () {
          context.go(destinations[index]);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
