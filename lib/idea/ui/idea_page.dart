import 'package:ait_training/common/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/idea_cubit.dart';

class IdeaPage extends StatelessWidget {
  const IdeaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IdeaCubit, IdeaState>(builder: (context, state) {
      var cubit = context.read<IdeaCubit>();
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardWidget(
              mainWord: state.activity,
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
    });
  }
}
