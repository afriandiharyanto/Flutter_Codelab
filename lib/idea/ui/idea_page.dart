import 'package:ait_training/common/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../cubit/idea_cubit.dart';

class IdeaPage extends StatelessWidget {
  const IdeaPage({super.key});

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
      body: BlocBuilder<IdeaCubit, IdeaState>(builder: (context, state) {
        return switch (state) {
          IdeaLoading() => Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.black45,
                size: 42,
              ),
            ),
          IdeaError() => Center(
              child: Text(state.exception.toString()),
            ),
          IdeaLoaded() => IdealLoadedView(data: state),
          IdeaState() => const Center(
              child: Text("Default"),
            ),
        };
      }),
    );
  }
}

class IdealLoadedView extends StatelessWidget {
  const IdealLoadedView({required this.data, super.key});

  final IdeaLoaded data;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<IdeaCubit>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardWidget(
            mainWord: data.activity,
            bgColor: Colors.cyan,
            fontSize: 18.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {
                cubit.getRandomIdea();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.9), fontSize: 14.0),
              )),
        ],
      ),
    );
  }
}
