import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaizen/models/reward/view/reward_form_button.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';

void main() {
  testWidgets("RewardForm add Reward to ShopBloc", (tester) async {
    final bloc = ShopBloc();
    await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
            create: (context) => bloc,
            child: const Scaffold(body: RewardFormButton()))));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    var inputs = find.byType(TextFormField);

    await tester.enterText(inputs.first, "Title");
    await tester.enterText(inputs.last, "Description");

    await tester.tap(find.byType(ElevatedButton).last);
    await tester.pumpAndSettle();

    expect(bloc.state.rewards.length, 1);
    expect(bloc.state.rewards[0].title, "Title");
    expect(bloc.state.rewards[0].description, "Description");
    expect(bloc.state.rewards[0].price, 100);
    expect(bloc.state.rewards[0].rating, 0);
  });

  testWidgets("RewardForm Title or Description not set", (tester) async {
    final bloc = ShopBloc();
    await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
            create: (context) => bloc,
            child: const Scaffold(body: RewardFormButton()))));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton).last);
    await tester.pumpAndSettle();

    expect(bloc.state.rewards.length, 0);
  });
}
