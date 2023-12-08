import 'package:ait_training/common/widgets/card_widget.dart';
import 'package:ait_training/quotes/cubit/quotes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuotesCubit, QuotesState>(builder: (context, state) {
      QuotesCubit cubit = context.read<QuotesCubit>();
      return switch (state) {
        QuotesLoading() => Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.black45,
              size: 42,
            ),
          ),
        QuotesError() => Center(
            child: Text(state.exception.toString()),
          ),
        QuotesLoaded() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardWidget(
                  mainWord: "${state.content} \n-${state.name} : ${state.tag}-",
                  bgColor: Colors.cyan,
                  fontSize: 18.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.fetchQuotes();
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
          ),
        QuotesState() => const Center(
            child: Text("Default"),
          ),
      };
    });
  }
}
