import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaitingScreen<Bloc extends StateStreamable<State>, State>
    extends StatelessWidget {
  final Widget Function(State state) builder;
  final bool Function(State state) buildWhen;

  const WaitingScreen(
      {super.key, required this.builder, required this.buildWhen});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc, State>(builder: (context, state) {
      if (buildWhen(state)) {
        return builder(state);
      } else {
        return const Text("Sto caricando");
      }
    });
  }
}
